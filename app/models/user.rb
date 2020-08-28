class User < ApplicationRecord
    has_secure_password
    validates :name, :email, :username, presence: true
    validates :username, uniqueness: true
    has_many :reviews
    has_many :locations, through: :reviews
    has_one_attached :profile_pic
end