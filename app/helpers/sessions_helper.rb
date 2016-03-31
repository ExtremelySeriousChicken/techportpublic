module SessionsHelper
    #The method used to login
    def login(user)
        token = User.new_token

        user.update_attribute(:token, token)

        return token
    end

end
