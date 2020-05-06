module RoleAuthorization
    module Models
        class Base < ActiveRecord::Base
            def table_name_prefix
                "role_auth_"
            end
        end
    end
end