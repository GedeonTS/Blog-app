class Post < ApplicationRecord
  validates :Title, presence: true, length: { maximum: 250 }
  validates :CommentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :LikesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: 'User', foreign_key: 'AuthorId', counter_cache: true
  has_many :comments
  has_many :likes

  def recent_comments
    comments.order('created_at Desc').limit(5)
  end

  def update_post_counter
    author.increment!(:PostsCounter)
  end
end
