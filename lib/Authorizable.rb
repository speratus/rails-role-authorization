module RoleAuthorization::Authorizable
    def self.included(base)
        base&.has_one :model_group, as: :record
        base&.has_one :group, through: :model_group

        base&.validates :group, presence: true
    end
end