class ChangeForeignKeyOnChats < ActiveRecord::Migration[8.0]
  def change
    remove_foreign_key :chats, :users

    change_column_null :chats, :user_id, true 

    add_foreign_key :chats, :users, on_delete: :nullify
  end
end
