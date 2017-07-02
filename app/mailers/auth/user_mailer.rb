class Auth::UserMailer < ApplicationMailer

  def register_email(user)
    @user = user
    mail(to: user.email, subject: "Willkommen du Oasch!")
  end

end
