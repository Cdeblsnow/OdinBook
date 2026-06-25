class LikesController < ApplicationController
  before_action :set_post
  before_action :set_like

  def add_like
    @like.num_dislikes = (@like&.num_dislikes - 1).clamp(0..)
    @like.num_likes += 1
    if @like.save && @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def remove_like
    @like = Like.find_by(post_id: @post.id)
    @like.num_likes -= 1
    @like.num_dislikes += 1
    if  @like.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end


  private


  def set_post
    @post = Post.find(params[:id])
  end
  def set_like
    @like = current_user.likes.find_by(post_id: @post.id) || set_new
  end

  def set_new
    @like = @post.likes.build
    @like.user_id = current_user.id
    @like
  end
end
