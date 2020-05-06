module RoleAuthorization
    module Models
        class Permission < ActiveRecord::Base
            validates :name, :record_name, presence: true
        end
    end
end
