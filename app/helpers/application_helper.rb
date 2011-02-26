module ApplicationHelper
  
  def extended_username
    if current_user.admin?
      "#{current_user.username} (admin)"
    else
      current_user.username
    end
  end
  
end
