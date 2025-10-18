class AddRoomToUsers < ActiveRecord::Migration[8.0]
  def change
    add_reference :users, :room, foreign_key: true
  end
end
