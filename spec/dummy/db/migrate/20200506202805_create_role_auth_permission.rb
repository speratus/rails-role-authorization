class CreateRoleAuthPermission < ActiveRecord::Migration[6.0]
  def change
    create_table :role_auth_permissions do |t|
      t.string :name
      t.string :record_name
    end
  end
end
