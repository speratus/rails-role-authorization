require "role-authorization/railtie"
require_relative '../app/models'

module RoleAuthorization
    def self.table_name_prefix
        'roleauth_'
    end
end
