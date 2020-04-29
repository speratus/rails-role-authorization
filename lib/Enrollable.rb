include RoleAuthorization::Models

module RoleAuthorization::Enrollable
    def self.included(base)
        base&.has_many :role_members, as: :member
        base&.has_many :roles, through: :role_members
    end
end