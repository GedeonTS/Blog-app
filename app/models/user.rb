class User < ApplicationRecord
  before_create :set_default_avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validates :name, presence: true
  # validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  has_many :posts, foreign_key: 'author_id'

  def recent_post
    posts.order('created_at Desc').limit(3)
  end

  private

  def set_default_avatar
    self.photo = 'https://images.unsplash.com/photo-1624258012851-c59960784150?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=389&q=80'
  end
end
