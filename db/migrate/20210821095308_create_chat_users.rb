class CreateChatUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_users do |t|
      t.references :user
      t.references :chat
    end
  end
end
