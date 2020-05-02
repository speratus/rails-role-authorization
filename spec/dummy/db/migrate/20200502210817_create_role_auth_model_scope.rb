class CreateRoleAuthModelScope < ActiveRecord::Migration[6.0]
  def change
    create_table :role_auth_model_scopes do |t|
      t.references :record, polymorphic: true, null: false
      t.references :role_auth_scope, null: false, foreign_key: true
    end
  end
end
