require "role-authorization/railtie"

module RoleAuthorization
    def self.table_name_prefix
        'roleauth_'
    end
end
