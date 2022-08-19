class Post < ApplicationRecord
  # validates :title, presence: true, length: { maximum: 250 }
  # validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  def recent_comments
    comments.order('created_at Desc').limit(5)
  end

  def update_post_counter
    author.increment!(:posts_counter)
  end
end
