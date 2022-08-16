require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.',
                     PostsCounter: 0)
  post = Post.create(AuthorId: user, Title: 'Hello', Text: 'This is my first post', CommentsCounter: 1, LikesCounter: 1)

  subject { Comment.new(posts_id: post, AuthorId: user, Text: 'this is where the comment text goes') }

  before { subject.save }

  it 'comments counter should not be nil' do
    expect(post.CommentsCounter).to eq 1
  end
end
