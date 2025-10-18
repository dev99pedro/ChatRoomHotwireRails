class CreateRoomUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :room_users do |t|
      t.timestamps
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
    end
  end
end
