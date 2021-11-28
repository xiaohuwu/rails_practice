class User < ApplicationRecord

    validates :user_name, presence: true
    validates :user_name, uniqueness: true
    validates :password, presence: true
    validates :password, length: {minimum: 6}

end
