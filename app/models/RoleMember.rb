module RoleAuthorization
    module Models
        class RoleMember < ActiveRecord::Base
            validates :role, :member, presence: true

            belongs_to :role
            belongs_to :member, polymorphic: true
        end
    end
end