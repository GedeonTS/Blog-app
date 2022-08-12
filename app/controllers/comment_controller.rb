class CommentController < ApplicationController
  def update_comment_counter(_id)
    comment = Comment.where(posts_id: 1)
    post = Post.find(1)
    post.update(CommentsCounter: comment.length)
  end
end
