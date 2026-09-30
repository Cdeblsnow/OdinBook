class PostLikesController < ApplicationController
  before_action :set_post
  before_action :set_user
  before_action :set_like

  def add_like
    @post.num_of_dislikes = (@post&.num_of_dislikes - 1).clamp(0..)
    @post.number_of_likes += 1
    if  @post.save!
      respond_to do |format|
        format.html { redirect_to @post }
        format.json { render json: { status: "ok",
        likes_text: @post.number_of_likes,
        dislikes_text: @post.num_of_dislikes }, status: :ok }
        add_notification("liked")
      end

    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def remove_like
    @like = PostLike.find_by(post_id: @post.id)
    @post.number_of_likes = (@post&.number_of_likes - 1).clamp(0..)
    @post.num_of_dislikes += 1
    if  @post.save
      @like.destroy!
      respond_to do |format|
        format.html { redirect_to @post }
        format.json { render json: { status: "ok",
       likes_text: @post.number_of_likes,
        dislikes_text: @post.num_of_dislikes }, status: :ok }
        add_notification("disliked")
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_notification(interaction)
    @user.add_notification(current_user.id, interaction, "post", @post.id)
  end




  private


  def set_post
    @post = Post.find(params[:id])
  end

  def set_user
    @user = User.find(@post.author_id)
  end

  def set_like
    @like = current_user.post_likes.find_by(post_id: @post.id) || set_new
  end

  def set_new
    @like = @post.post_likes.build
    @like.user_id = current_user.id
    @like
  end
end
