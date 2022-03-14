class CreateJoinTableItemOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :join_table_item_orders do |t|
      t.integer :quantity, default: 1

      t.timestamps
    end
  end
end
