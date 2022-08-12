class PostController < ApplicationController
  def update_post_counter(author_id)
    posts = Post.where(AuthorId: author_id)
    user = User.find(author_id)
    user.update(PostsCounter: posts.length)
  end

  def five_last_comments(id)
    Comment.where(PostId: id).last(5)
  end
end
