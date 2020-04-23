module RoleAuthorization
    module Models
        class Permission < Base
            validates :name, :model_name, presence: true
        end
    end
end
