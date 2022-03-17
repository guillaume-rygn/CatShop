class JoinTableItemOrder < ApplicationRecord
  belongs_to :item
  belongs_to :order

  after_create :image_send

  def image_send
    UserMailer.email_image(self).deliver_now
  end
  
end
