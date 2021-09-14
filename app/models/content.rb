class Content < ApplicationRecord
  belongs_to :user

  has_many :folder_contents
  has_many :folders, through: :folder_contents

  before_create :validate_user_folders

  alias_attribute :sender, :user

  has_one_attached :file

  def validate_user_folders
    folders.each do |folder|
      raise "User #{sender.email} does not have permission to chat '#{folder.name}'!" unless folder.users.include?(sender)
    end
  end
end