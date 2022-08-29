class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comments = Comment.where(post_id: @post.id)
    @likes = Like.where(post_id: @post.id)

    respond_to do |format|
      format.html # comments.html.erb
      format.json { render json: @comments }
    end
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

  def destroy
    user = current_user
    @post = Post.find_by(id: params[:id], author_id: params[:user_id])

    if @comment.destroy
      flash[:notice] = 'Post deleted!'
    else
      flash[:alert] = 'Error! Please try again later.'
    end
    redirect_to user_posts_path(user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
