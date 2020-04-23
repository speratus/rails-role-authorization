module RoleAuthorization
    module Models
        class ModelGroup < Base
            validates :group, :record, presence: true

            belongs_to :record, polymorphic: true
            belongs_to :group
        end
    end
end