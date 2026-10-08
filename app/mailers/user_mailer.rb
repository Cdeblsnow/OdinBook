class UserMailer < ApplicationMailer
  default from: "MyCoolApp@wxample.com"
  layout "mailer"

  def welcome_email(user)
    @user = user
    @url = "mycoolapp.com/login"
    mail(to: @user.email, subject: "Welcome to my cool app")
  end
end
