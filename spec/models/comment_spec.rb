require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                     posts_counter: 0)
  post = Post.create(author_id: user, title: 'Hello', text: 'This is my first post', comments_count: 1)

  subject { Comment.new(post_id: post, author_id: user, text: 'this is where the comment text goes') }

  before { subject.save }

  it 'comments counter should not be nil' do
    expect(post.comments_count).to eq 1
  end
end
