class CreateRoleAuthScope < ActiveRecord::Migration[6.0]
  def change
    create_table :role_auth_scopes do |t|
      t.string :name
      t.string :model_name
    end
    add_index :role_auth_scopes, :name, unique: true
  end
end
