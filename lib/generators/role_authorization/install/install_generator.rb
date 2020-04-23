module RoleAuthorization
    module Generators
        class InstallGenerator < Rails::Generators::Base
            def generate_permission_migration
                generate "migration", "CreateRoleAuthPermissions name model_name"
            end

            def generate_role_migration
                generate "migration", "CreateRoleAuthRoles name role_auth_group:references"
            end

            def generate_role_perm_migration
                generate "migration", "CreateRoleAuthRolePermission permission:references role_auth_role:references"
            end

            def generate_group_migration
                generate "migration", "CreateRoleAuthGroup name model_name"
            end
            def generate_record_group_migration
                generate "migration", "CreateRoleAuthModelGroup record:references{polymorphic} role_auth_group:references"
            end

            def migrate
                rake "db:migrate"
            end
        end
    end
end