class User < ApplicationRecord
    attr_reader :password

    validates :username, presence: true
    validates :session_token, presence: true
    validates :password_digest, presence: {message: "Password can't be blank"}
    validates :password, length: {minimum: 6, allow_nil: true}

    before_validation :ensure_session_token

    def User.find_by_credentials(username, password)
        user = User.find_by(username: username)
        return user if user.is_password?(password)
        nil
    end

    def is_password?(password)
        self.password_digest = BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    protected

    def User.generate_session_token
        SecureRandom.base64
    end

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end

    def reset_session_token!
        self.session_token = User.generate_session_token
    end
end
