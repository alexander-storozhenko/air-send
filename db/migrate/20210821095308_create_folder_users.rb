class CreateFolderUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :folder_users do |t|
      t.references :user
      t.references :folder
    end
  end
end
