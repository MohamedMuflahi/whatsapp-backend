class User < ApplicationRecord
    has_many :messages
    has_many :chats
    has_many :rooms, through: :chats
    has_secure_password
    validates :username,uniqueness: true,presence: true
end
