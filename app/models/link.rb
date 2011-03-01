class Link < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of   :url, :title, :user
  validates_url_format_of :url, :allow_nil => true
  
end
