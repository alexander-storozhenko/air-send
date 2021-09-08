class ChatUser < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :chat
end