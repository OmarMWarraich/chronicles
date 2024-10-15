class AdminMailer < ApplicationMailer
  default from: 'no-reply@topgeardirect.com'

  def new_user(user)
    @user = user
    mail(to: @user.email, subject: "New User: #{user.email}")
  end
end
