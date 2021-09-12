class ContentUser < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :folder
end