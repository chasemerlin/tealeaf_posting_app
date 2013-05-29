class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories

  has_many :comments
  belongs_to :user

  has_many :votes, as: :voteable 

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true

  def total_votes
  	self.votes.where(vote: true).size - self.votes.where(vote: false).size
  end
end
