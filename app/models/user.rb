class User < ApplicationRecord
  include Auth

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :lockable, :timeoutable, :trackable

  has_many :chat_users
  has_many :chats, through: :chat_users

  enum role: [:guest, :sub_admin, :admin]

  def jwt
    encode_jwt({id: id})
  end
end
