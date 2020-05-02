class CreateRoleAuthRolePermission < ActiveRecord::Migration[6.0]
  def change
    create_table :role_auth_role_permissions do |t|
      t.references :permission, null: false, foreign_key: true
      t.references :role_auth_role, null: false, foreign_key: true
    end
  end
end
