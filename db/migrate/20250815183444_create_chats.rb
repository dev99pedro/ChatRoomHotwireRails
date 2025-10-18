class CreateChats < ActiveRecord::Migration[8.0]
  def change
    create_table :chats do |t|
      t.timestamps
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.text :content, null: false
    end
  end
end
