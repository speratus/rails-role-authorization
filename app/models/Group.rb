module RoleAuthorization
    module Models
        class Group < Base
            validates :name, :model_name, presence: true
        end
    end
end