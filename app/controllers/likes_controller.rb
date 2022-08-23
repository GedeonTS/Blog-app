class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    # author = User.find(post.author_id)
    @like = current_user.likes.build(post_id: post.id)
    # @like = Like.new(post_id:post.id, author:)
    if @like.save
      redirect_to user_post_url(post.author_id, post.id)
    else
      redirect_to user_post_url(author, post), alert: 'Like was not created.'
    end
  end
end
