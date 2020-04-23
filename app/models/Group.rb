module RoleAuthorization
    module Models
        class Group < Base
            validates :name, :model_name, presence: true
            validates :name, :uniqueness: true
        end
    end
end