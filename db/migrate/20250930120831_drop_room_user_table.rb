class DropRoomUserTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :room_users
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
