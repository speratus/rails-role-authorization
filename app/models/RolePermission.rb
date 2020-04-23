module RoleAuthorization
    module Models
        class RolePermission < Base
            belongs_to :permission
            belongs_to :role
        end
    end
end