class AddReferenceToFoldersToContents< ActiveRecord::Migration[5.2]
  def change
    add_reference :contents, :folder, index: true
  end
end
