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
  
  def user_vote(user)
    if user
      vote = self.votes.find_by_user_id(user.id)
      vote.value if vote
    else
      return nil
    end
  end
  
  def upvote(user)
    vote = user.votes.build(:link => self, :value => 1)
    vote.save
  end
  
  def downvote(user)
    vote = user.votes.build(:link => self, :value => -1)
    vote.save
  end
  
  def remove_vote(user)
    vote = user.votes.find_by_link_id(self)
    vote.destroy
  end
end
