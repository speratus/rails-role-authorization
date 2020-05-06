module RoleAuthorization
    module Models
        class ModelScope < ActiveRecord::Base
            validates :scope, :record, presence: true

            belongs_to :record, polymorphic: true
            belongs_to :scope
        end
    end
end