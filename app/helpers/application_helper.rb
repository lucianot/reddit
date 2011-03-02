module ApplicationHelper
  
  def extended_username
    if current_user.admin?
      "#{current_user.username}(A)"
    else
      current_user.username
    end
  end

end
