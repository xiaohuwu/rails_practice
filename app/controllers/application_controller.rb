class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # Authentication
 # before_action :authenticate_user!

  def current_user
    @current_user ||= User.find 1
  end

end
