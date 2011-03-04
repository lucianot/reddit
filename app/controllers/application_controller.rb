class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  
  def voted?(link)
    !!current_user.votes.find_by_link_id(link.id)
  end
  
end
