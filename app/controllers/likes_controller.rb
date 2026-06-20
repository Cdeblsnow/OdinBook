class LikesController < ApplicationController
  before_action :set_post

  def add_like
    @like = @post.likes.build
    @like.user_id = current_user.id
    @post.number_of_likes =+ 1
    if @like.save && @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def remove_like
    @like = Like.find_by(post_id: @post.id)
    @like.destroy!
    @post.number_of_likes =- 1
    if  @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end


  private


  def set_post
    @post = Post.find(params[:id])
  end
end
