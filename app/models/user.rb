class User < ApplicationRecord
  include Auth

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :lockable, :timeoutable, :trackable

  has_many :folder_users
  has_many :folders, through: :folder_users

  after_create :create_default_folder

  enum role: [:guest, :sub_admin, :admin]

  def jwt
    encode_jwt({id: id})
  end

  def create_default_folder
    Folder.create!(users: [self], name: 'default')
  end
end
