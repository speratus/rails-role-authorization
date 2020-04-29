include RoleAuthorization::Models

module RoleAuthorization::Authorizable
    def self.included(base)
        base&.has_one :model_group, as: :record
        base&.has_one :group, through: :model_group

        base&.validates :group, presence: true

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
            group = self.group
            all_roles = Role.joins(:permissions).where(permission: {name: permission})
            valid_roles = all_roles.where(group: group)
            # Check whether user is a member of any of the roles in valid_roles
        end
    end
end
