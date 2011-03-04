class HomepageController < ApplicationController
  
  def index
    @links = Link.all.sort_by! { |link| -link.score }
  end
  
end
