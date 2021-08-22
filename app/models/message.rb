class Message < ApplicationRecord
  belongs_to :user

  has_many :chat_messages
  has_many :chats, through: :chat_messages

  before_create :validate_user_chats

  alias_attribute :sender, :user

  def validate_user_chats
    raise 'validate error' unless chats.order(:id) == Chat.where(users: [sender]).order(:id).pluck(:id)
  end
end