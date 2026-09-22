class CommentLikesController < ApplicationController
  before_action :set_comment
  before_action :set_like
  before_action :set_user

  def add_like
    @comment.num_of_dislikes = (@comment&.num_of_dislikes - 1).clamp(0..)
    @comment.num_of_likes += 1
    if  @comment.save!
      respond_to do |format|
        format.html { redirect_to @comment }
        format.json { render json: { status: "ok",
        likes_text: @comment.num_of_likes,
        dislikes_text: @comment.num_of_dislikes }, status: :ok }
        add_notification("liked")
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def remove_like
    @like = CommentLike.find_by(comment_id: @comment.id)
    @comment.num_of_likes = (@comment&.num_of_likes - 1).clamp(0..)
    @comment.num_of_dislikes += 1
    if  @comment.save
      @like.destroy!
      respond_to do |format|
        format.html { redirect_to @comment }
        format.json { render json: { status: "ok",
        likes_text: @comment.num_of_likes,
        dislikes_text: @comment.num_of_dislikes }, status: :ok }
      end
      add_notification("disliked")
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_notification(interaction)
    @user.class
    @user.add_notification(current_user.id, interaction, "comment")
  end



  private


  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_user
    @user = User.find(@comment.user_id)
  end
  def set_like
    @like = current_user.comment_likes.find_by(comment_id: @comment.id) || set_new
  end

  def set_new
    @like = @comment.comment_likes.build
    @like.user_id = current_user.id
    @like
  end
end
