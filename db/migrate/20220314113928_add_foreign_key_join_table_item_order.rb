class AddForeignKeyJoinTableItemOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :join_table_item_orders, :item, foreign_key: true
    add_reference :join_table_item_orders, :order, foreign_key: true
  end
end
