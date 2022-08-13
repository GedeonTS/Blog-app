class User < ApplicationRecord
  validates :Name, presence: true
  validates :PostsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :comments, foreign_key: 'AuthorId'
  has_many :likes, foreign_key: 'AuthorId'
  has_many :posts, foreign_key: 'AuthorId'

  def recent_post
    posts.order('created_at Desc').limit(3)
  end
end
