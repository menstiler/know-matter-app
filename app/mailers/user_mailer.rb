class UserMailer < ApplicationMailer

  def welcome_email(user)
<<<<<<< HEAD
    # byebug
=======
>>>>>>> master
    @user = user
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
