class Order < ApplicationRecord
  has_many :join_table_item_orders
  has_many :items, through: :join_table_item_orders

  belongs_to :user
end
