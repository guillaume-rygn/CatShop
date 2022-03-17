class User < ApplicationRecord
  # before_action :authenticate_user!, only: [: rajouter des pages]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart
  has_many :orders
  #should we add email confirmation and a password confirmation?

  after_create :cartcreate
  after_create :welcome_send


  def cartcreate
    Cart.create(user_id: self.id)
  end

  def welcome_send
UserMailer.welcome_email(self).deliver_now
end

end
