module RoleAuthorization
    module Generators
        class InstallGenerator < Rails::Generators::Base
            def generate_permission_migration
                generate "migration", "RoleAuthorization::Permission name model_name"
            end

            def generate_role_migration
                generate "migration", "RoleAuthorization::Role name scope_name"
            end

            def generate_role_perm_migration
                generate "migration", "RoleAuthorization::RolePermission permission:references role:references"
            end

            def generate_scope_migration
                generate "migration", "RoleAuthorization::Scope name model_name"
            end
            
            def generate_parent_migration
                generate "migration", "RoleAuthorization::Parent object_id:integer model_name"
            end

            def generate_model_parent_migration
                generate "migration", "RoleAuthorization::ModelParent model_id:integer model_type parent:references"
            end

            def migrate
                rake "db:migrate"
            end
        end
    end
end