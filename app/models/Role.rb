module RoleAuthorization
    module Models
        class Role < Base
            validates :name, :group, presence: true

            has_many :role_permissions
            has_many :permissions, through: :role_permissions
        end
    end
end