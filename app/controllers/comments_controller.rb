class CommentsController < ApplicationController
    def new
        @comment = Comment.new
    end
  def create
    post = Post.find(params[:post_id])
    author = post.author
    @comment = Comment.new(comment_parameters)
    @comment.post = post
    @comment.author = current_user

    render :new unless @comment.save

    redirect_to user_post_url(author, post)
  end

  private

  def comment_parameters
    params.require(:comment).permit(:text)
  end
end
