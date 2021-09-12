class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :text
      t.references :user
      t.timestamps null: false
    end
  end
end
