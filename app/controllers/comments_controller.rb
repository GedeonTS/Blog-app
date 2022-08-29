class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    post = Post.find(params[:post_id])

    @comment = Comment.new(comment_parameters)
    @comment.post_id = post.id
    @comment.author = current_user

    redirect_to user_post_url(post.author_id, post) if @comment.save
    render :new unless @comment
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.js { render :index }
      format.html { redirect_to user_post_path(current_user, @comment.post) }
      flash[:success] = 'Comment deleted successfully'
    end
  end

  private

  def comment_parameters
    params.require(:comment).permit(:text)
  end
end
