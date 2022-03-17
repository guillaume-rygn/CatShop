class Order < ApplicationRecord
  has_many :join_table_item_orders
  has_many :items, through: :join_table_item_orders

  belongs_to :user
  validates :user_id, presence: true
  #total of the prices?

  after_create :order_send

  def order_send
    UserMailer.email_order(self).deliver_now
  end
  
end
