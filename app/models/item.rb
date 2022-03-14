class Item < ApplicationRecord
  has_many :join_table_cart_items
  has_many :carts, through: :join_table_cart_items

  has_many :join_table_item_orders
  has_many :orders, through: :join_table_item_orders
end
