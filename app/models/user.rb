class User < ApplicationRecord
  has_many :comments, foreign_key: 'AuthorId'
  has_many :likes, foreign_key: 'AuthorId'
  has_many :posts, foreign_key: 'AuthorId'

  def recent_post
    posts.order('created_at Desc').limit(3)
  end
end
