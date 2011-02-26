class Link < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :url, :title, :user_id
  # validates_presence_of :description, :if => :self_link?
  # validates_presence_of :url, :unless => :self_link?
  # 
  # def self_link
  #   title == "self"
  # end
  
end
