class CreateRooms < ActiveRecord::Migration[8.0]
  def change
    create_table :rooms do |t|
      t.timestamps
      t.string :name
    end
  end
end
