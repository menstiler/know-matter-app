class WelcomeController < ApplicationController
  before_action :authorized

  def home
    @student = Student.find(session[:user_id])
    @hobbies = Hobby.random_selection
  end

end
