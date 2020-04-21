module RoleAuthorization
    module Generators
        class InstallGenerator < Rails::Generators::Base
            def generate_permission_migration
                generate "migration", "RoleAuthorization::Permission name model_name"
            end

            def generate_role_mgration
                generate "migration", "RoleAuthorization::Role name scope_name"
            end

            def generate_role_perm_migration
                generate "migration", "RoleAuthorization::RolePermission permission:references role:references"
            end

            def generate_scope_migration
                generate "migration", "RoleAuthorization::Scope name model_name"
            end
        end
    end
end