class RevertForeignKeysOnChatsAndRoomUsers < ActiveRecord::Migration[8.0]
  def change
    # Revertendo em chats
    remove_foreign_key :chats, :users
    change_column_null :chats, :user_id, false
    add_foreign_key :chats, :users

    # Revertendo em room_users
    remove_foreign_key :room_users, :users
    change_column_null :room_users, :user_id, false
    add_foreign_key :room_users, :users
  end
end
