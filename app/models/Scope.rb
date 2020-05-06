module RoleAuthorization
    module Models
        class Scope < ActiveRecord::Base
            validates :name, :record_name, presence: true
            validates :name, uniqueness: true
        end
    end
end