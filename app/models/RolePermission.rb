module RoleAuthorization
    module Models
        class RolePermission < ActiveRecord::Base
            belongs_to :permission
            belongs_to :role
        end
    end
end