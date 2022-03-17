class UserMailer < ApplicationMailer
  default from: 'reygner0224@gmail.com'


  def welcome_email(user)
    @user = user
    @url = 'https://catshop-io.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to CatShop')
  end

  def email_order(order)
    @order = order
    @amount = order.total
    @user = order.user
    @url = 'https://catshop-io.herokuapp.com/'
    mail(to: @user.email, subject: 'Order on CatShop')
  end

  def email_image(joinorder)
    @order = joinorder
    @user = joinorder.order.user
    @item = joinorder.item
    @image_url = joinorder.item.image_url
    @url = 'https://catshop-io.herokuapp.com/'
    mail(to: @user.email, subject: 'Order on CatShop')
  end

  #each file to update
  #app/mailers/user_mailer.rb
  #app/models/join_table_item_order.rb
  #app/models/order.rb
  #app/views/user_mailer/email_image.html.erb with .text
  #app/views/user_mailer/email_order.html.erb with .text

end
