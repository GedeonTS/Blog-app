class CommentsController < ApplicationController
    def new
      @comment = Comment.new
    end
  def create
    post = Post.find(params[:post_id])
    
    @comment =  Comment.new(comment_parameters)
    @comment.post_id = post.id
    @comment.author = current_user

    redirect_to user_post_url(post.author_id, post) if @comment.save
    render :new unless @comment
  end

  private
  def comment_parameters
    params.require(:comment).permit(:text)
  end
end
