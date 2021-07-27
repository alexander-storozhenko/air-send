class AddReferenceToChatsToMessages < ActiveRecord::Migration[5.2]
  def change
    add_reference :messages, :chat, index: true
  end
end
