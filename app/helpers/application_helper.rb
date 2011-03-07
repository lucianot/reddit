module ApplicationHelper
  
  require 'uri'
  
  def extended_username
    if current_user.admin?
      "#{current_user.username}(A)"
    else
      current_user.username
    end
  end
  
  def host_only(url)
    URI.parse(url).host
  end

end
