class ApplicationController < ActionController::Base
  helper_method :current_user
  # helper_method :authorized?

  def current_user
    @student = Student.find(session[:user_id])
  end

  def signed_in?
    !!current_user
  end

  def authorized
   redirect_to login_path unless signed_in?
  end

end
