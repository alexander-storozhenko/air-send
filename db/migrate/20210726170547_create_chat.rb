class CreateChat < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.string :uid
      t.string :name
    end
  end
end
