class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comments = Comment.where(post_id: @post.id)
    @likes = Like.where(post_id: @post.id)
  end

  def new
    @current = current_user
  end

  def create
    new_post = current_user.posts.build(post_params)

    respond_to do |format|
      format.html do
        if new_post.save
          redirect_to user_post_path(new_post.author_id, new_post.id), notice: 'Post was successfully created.'
        else
          render :new, alert: 'Post was not created.'
        end
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
