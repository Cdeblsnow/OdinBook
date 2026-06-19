class LikesController < ApplicationController
  before_action :set_post

  def new
    @like = @post.likes.build
  end
  def create
    @like = @post.likes.build
    @like.user_id = current_user.id
    if @like.save
      @post.number_of_likes =+ 1
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end


  private


  def set_post
    @post = Post.find(params[:post_id])
  end
end
