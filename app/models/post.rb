class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories

  has_many :comments
  belongs_to :user

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
end
