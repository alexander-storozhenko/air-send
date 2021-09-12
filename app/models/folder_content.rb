class FolderContent < ApplicationRecord
  belongs_to :folder
  belongs_to :content
end