class CreateRoleAuthRoleMember < ActiveRecord::Migration[6.0]
  def change
    create_table :role_auth_role_members do |t|
      t.references :member, plymorphic: true, null: false, foreign_key: true
      t.references :role_auth_role, null: false, foreign_key: true
    end
  end
end
