class AddForeignKeyJoinTableCartItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :join_table_cart_items, :cart, foreign_key: true
    add_reference :join_table_cart_items, :item, foreign_key: true
  end
end
