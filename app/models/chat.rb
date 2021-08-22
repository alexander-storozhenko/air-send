class Chat < ApplicationRecord
  has_many :chat_users
  has_many :users, through: :chat_users

  has_many :chat_messages
  has_many :messages, through: :chat_messages
end