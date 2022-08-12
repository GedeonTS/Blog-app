class UserController < ApplicationController
  def find_three_last(id)
    Post.where(AuthorId: id).last(3)
  end
end
