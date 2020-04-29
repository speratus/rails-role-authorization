module RoleAuthorization
    module Models
        class ModelScope < Base
            validates :scope, :record, presence: true

            belongs_to :record, polymorphic: true
            belongs_to :scope
        end
    end
end