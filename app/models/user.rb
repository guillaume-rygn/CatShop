class User < ApplicationRecord
  # before_action :authenticate_user!, only: [: rajouter des pages]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart
  has_many :orders
  #should we add email confirmation and a password confirmation?
end
