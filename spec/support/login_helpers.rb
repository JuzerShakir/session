module LoginHelpers
    def login_as(user)
        post "/login", params: { session: { email: user.email, password: user.password } }
    end
end