class FolderUser < ApplicationRecord
  belongs_to :folder, dependent: :destroy
  belongs_to :user
end