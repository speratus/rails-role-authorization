module RoleAuthorization
    module Models
        class Role < ActiveRecord::Base
            validates :name, :scope, presence: true

            belongs_to :scope
            has_many :role_permissions
            has_many :permissions, through: :role_permissions
        end
    end
end