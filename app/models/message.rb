class Message < ApplicationRecord
  belongs_to :user

  has_many :chat_messages
  has_many :chats, through: :chat_messages

  before_create :validate_user_chats

  alias_attribute :sender, :user

  has_one_attached :file

  def validate_user_chats
    chats.each do |chat|
      raise "User #{sender.email} does not have permission to chat '#{chat.name}'!" unless chat.users.include?(sender)
    end
  end
end