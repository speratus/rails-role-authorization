module RoleAuthorization
    module Models
        class Permission < ActiveRecord::Base
            validates :name, :model_name, presence: true
        end
    end
end
