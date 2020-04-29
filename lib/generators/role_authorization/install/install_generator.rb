module RoleAuthorization
    module Generators
        class InstallGenerator < Rails::Generators::Base
            def generate_migrations
                generate "migration", "CreateRoleAuthPermissions name model_name"
                generate "migration", "CreateRoleAuthRoles name role_auth_scope:references"
                generate "migration", "CreateRoleAuthRolePermission permission:references role_auth_role:references"
                generate "migration", "CreateRoleAuthScope name:uniq model_name"
                generate "migration", "CreateRoleAuthModelScope record:references{polymorphic} role_auth_scope:references"
            end

            def migrate
                rake "db:migrate"
            end
        end
    end
end