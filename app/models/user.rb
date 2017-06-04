VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
class User < ApplicationRecord
    validates :first_name, :last_name, :email, :presence => true
    validates :email, uniqueness: true
    validates :email, format: VALID_EMAIL_REGEX
end
