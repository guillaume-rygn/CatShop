class Cart < ApplicationRecord
  # before_action :authenticate_user!, only: [: rajouter des pages]
  
  has_many :join_table_cart_items
  has_many :items, through: :join_table_cart_items
  
  belongs_to :user

end
