class User < ApplicationRecord
    before_save { self.email = email.downcase }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :name, presence: true, length:  { maximum: 50 }
    validates :email, presence: true, length: { maximum: 250 }
    validates :email, format: {with: VALID_EMAIL_REGEX },
                      uniqueness: true
                    
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }

end
