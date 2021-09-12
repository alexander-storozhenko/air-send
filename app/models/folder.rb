class Folder < ApplicationRecord
  has_many :folder_users
  has_many :users, through: :folder_users

  has_many :folder_contents
  has_many :contents, through: :folder_contents
end