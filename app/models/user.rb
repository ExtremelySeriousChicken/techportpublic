class User < ActiveRecord::Base
    before_save { self.email = email.downcase }
    validates :name, presence: true, length: {maximum: 50}
    validates :email, presence: true, length: {maximum: 255},
            uniqueness: {case_sensitive: false}
    validates :password, length: {minimum: 6}
    has_secure_password

    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost:cost)
    end

    #for generating new token
    def User.new_token
        SecureRandom.urlsafe_base64
    end

    def token_authenticate(token)
        return self.token == token
    end
end
