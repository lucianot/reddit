class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :complete_username
  
  def complete_username
    # current_user = User.find_by_email(session[:email])
    @username = "Anderson Silva"
  end
  
end
