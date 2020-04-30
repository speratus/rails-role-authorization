module RoleAuthorization
    class AuthorizationError < ::StandardError

    end

    class UnauthorizedError < AuthorizationError
        
    end
end