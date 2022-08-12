class CommentController < ApplicationController
  def update_comment_counter(id)
    comment = Comment.where(posts_id: id)
    post = Post.find(id)
    post.update(CommentsCounter: comment.length)
  end
end
