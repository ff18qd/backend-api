class User < ApplicationRecord
    # user name and password must be present and email has format checking
    validates :name, presence: true
    validates :password, presence: true, length: { in: 6..20 }  
    validates :email, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
    has_secure_password
end
