class HomepageController < ApplicationController
  
  def index
    @links = Link.all
  end
  
end
