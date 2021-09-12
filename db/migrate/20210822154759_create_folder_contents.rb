class CreateFolderContents < ActiveRecord::Migration[5.2]
  def change
    create_table :folder_contents do |t|
      t.references :folder
      t.references :content
    end
  end
end
