module SessionHelpers
    def signup_as(user)
        post "/signup", params: { visitor: { email: user.email, password: user.password, password_confirmation: user.password_confirmation } }
    end

    def login_as(user)
        post "/login", params: { email: user.email, password: user.password }
    end
end