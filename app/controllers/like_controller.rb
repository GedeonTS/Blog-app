class LikeController < ApplicationController
  def update_like_counter(id)
    like = Like.where(PostId: id)
    post = Post.find(id)
    post.update(LikesCounter: like.length)
  end
end
