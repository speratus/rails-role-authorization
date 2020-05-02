class CreateRoleAuthRole < ActiveRecord::Migration[6.0]
  def change
    create_table :role_auth_roles do |t|
      t.string :name
      t.references :role_auth_scope, null: false, foreign_key: true
    end
  end
end
