class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      t.string :comments
      t.belongs_to :post
      t.belongs_to :user  
      t.timestamps
    end
  end
end
