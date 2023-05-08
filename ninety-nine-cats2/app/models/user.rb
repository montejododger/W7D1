class User < ApplicationRecord
    validates :username, :session_token, uniqueness: true, presence: true
    validates :password_digest, presence: true

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        if user && user.is_valid_password?
            user 
        else 
            nil 
        end 
    end 

    def password=(password)
        @password = password 
        self.password_digest = BCrypt::Password.create(password)
    end 

    def is_valid_password?(password)
        password_object = BCrypt::Password.new(self.password_digest)
        password_object.is_password?(password)
    end

    def reset_session_token!
        self.session_token = SecureRandom::url_safe64
        self.save!
        self.session_token
    end 

    def ensure_session_token
        self.session_token ||= SecureRandom::url_safe64
    end 


end
