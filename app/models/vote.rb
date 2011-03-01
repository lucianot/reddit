class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :link
  
  validates_presence_of :user, :link
  validates_inclusion_of :count, :in => [-1, 0, 1],
    :message => "%{value} is not a valid score"
    
  validates_uniqueness_of :link_id, :scope => :user_id, 
    :message => "can only be voted once per user"
  
end
