class Link < ActiveRecord::Base
  belongs_to :user
  has_many :votes, :dependent => :destroy
  
  validates_presence_of   :url, :title, :user
  validates_url_format_of :url, :allow_nil => true

  def score
    self.votes.map {|vote| vote.value}.sum
  end
  
  def voted?
    !!self.votes.find_by_user_id(current_user.id)
  end
  
end
