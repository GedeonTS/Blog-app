class LikesController < ApplicationController
    def create
        post = Post.find(params[:post_id])
            author = current_user
           @like = Like.new(post: post, author: author)
        if @like
            redirect_to user_post_url(author, post)
        else
            render :new, alert: 'Like was not created.'
        end
      end
end
