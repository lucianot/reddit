class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  
  def voted?(link)
    !!current_user.votes.find_by_link_id(link.id)
  end
  
  def authorize_admin!
    unless current_user.admin
      redirect_to root_path, :notice => 'This page is restricted to admins only.'
      return false
    end
  end
  
end
