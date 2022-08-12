class LikeController < ApplicationController
  def update_like_counter(id)
    like = Like.where(posts_id: id)
    post = Post.find(id)
    post.update(likesCounter: like.length)
  end
end
