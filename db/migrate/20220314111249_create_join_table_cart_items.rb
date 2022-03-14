class CreateJoinTableCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :join_table_cart_items do |t|
      t.integer :quantity, default: 1
      
      t.timestamps
    end
  end
end
