# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_06_202819) do

  create_table "role_auth_permissions", force: :cascade do |t|
    t.string "name"
    t.string "record_name"
  end

  create_table "role_auth_record_scopes", force: :cascade do |t|
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "role_auth_scope_id", null: false
    t.index ["record_type", "record_id"], name: "index_role_auth_record_scopes_on_record_type_and_record_id"
    t.index ["role_auth_scope_id"], name: "index_role_auth_record_scopes_on_role_auth_scope_id"
  end

  create_table "role_auth_role_members", force: :cascade do |t|
    t.integer "member_id", null: false
    t.integer "role_auth_role_id", null: false
    t.index ["member_id"], name: "index_role_auth_role_members_on_member_id"
    t.index ["role_auth_role_id"], name: "index_role_auth_role_members_on_role_auth_role_id"
  end

  create_table "role_auth_role_permissions", force: :cascade do |t|
    t.integer "permission_id", null: false
    t.integer "role_auth_role_id", null: false
    t.index ["permission_id"], name: "index_role_auth_role_permissions_on_permission_id"
    t.index ["role_auth_role_id"], name: "index_role_auth_role_permissions_on_role_auth_role_id"
  end

  create_table "role_auth_roles", force: :cascade do |t|
    t.string "name"
    t.integer "role_auth_scope_id", null: false
    t.index ["role_auth_scope_id"], name: "index_role_auth_roles_on_role_auth_scope_id"
  end

  create_table "role_auth_scopes", force: :cascade do |t|
    t.string "name"
    t.string "record_name"
    t.index ["name"], name: "index_role_auth_scopes_on_name", unique: true
  end

  add_foreign_key "role_auth_record_scopes", "role_auth_scopes"
  add_foreign_key "role_auth_role_members", "members"
  add_foreign_key "role_auth_role_members", "role_auth_roles"
  add_foreign_key "role_auth_role_permissions", "permissions"
  add_foreign_key "role_auth_role_permissions", "role_auth_roles"
  add_foreign_key "role_auth_roles", "role_auth_scopes"
end
