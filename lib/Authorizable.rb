include RoleAuthorization::Models

module RoleAuthorization::Authorizable
    def self.included(base)
        base&.has_one :model_group, as: :record
        base&.has_one :scope, through: :model_group

        base&.validates :scope, presence: true

        def base.define_permission(*args)
            args.each do |p|
                Permission.find_or_create_by(name: p, model_name: base.to_s)
            end
        end

        def base.define_group(name)
            Group.find_or_create_by(name: name, model_name: base.to_s)
        end

        def authorize_with(user)
            @user = user
        end

        def authorized?(user, permission)
            scope = self.scope
            all_roles = Role.joins(:permissions).where(permission: {name: permission})
            valid_roles = all_roles.where(scope: scope)
            members = valid_roles.joins(:members)
            members.include?(user)
        end

        def base.authorize_action(**action)
            actions = [:create, :update, :destroy]
            action.each_key do |key|
                if actions.include?(key)
                    method_name = "authorize_#{key.to_s}"
                    create_authorize_method(method_name, @user, action[key])

                    base.send("before_#{key}".to_sym, method_name.to_sym)
                elsif key == :read
                    method_name = :authorize_find
                    create_authorize_method(method_name, @user, action[key])

                    base.send(:after_find, method_name.to_sym)
                end
            end
        end

        private

        def create_authorize_method(method_name, user, permission)
            base.define_method(method_name) do 
                unless authorized?(@user, permission)
                    raise UnauthorizedError.new("#{@user} does not have permission #{permission} for #{base}.")
                end
            end
        end
    end
end
