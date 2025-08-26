class ChangeForeignKeyOnRoomUsers < ActiveRecord::Migration[8.0]
  def change
    remove_foreign_key :room_users, :users

    change_column_null :room_users, :user_id, true 

    add_foreign_key :room_users, :users, on_delete: :nullify
  end
end
