class UserMailer < ApplicationMailer
  default from: 'reygner0224@gmail.com'


  def welcome_email(user)
    @user = user
    @url = 'https://catshop-io.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to CatShop')
  end
end
