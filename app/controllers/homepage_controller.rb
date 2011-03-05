class HomepageController < ApplicationController
  
  def index
    @links = Link.all.sort {|a,b| b.score <=> a.score}
  end
  
end
