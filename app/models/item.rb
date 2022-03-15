class Item < ApplicationRecord
  has_many :join_table_cart_items
  has_many :carts, through: :join_table_cart_items

  has_many :join_table_item_orders
  has_many :orders, through: :join_table_item_orders
  # some title has to be here, unique
  validates :title, presence: true, uniqueness: true
  # a description (long of 30 characters min)
  validates :description, presence: true, length: {minimum: 30}
  # un prix devenant obligatoire, de type chiffre
  validates :price, presence: true, numericality: {only_integer: false}
end
