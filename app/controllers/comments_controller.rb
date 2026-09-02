class CommentsController < ApplicationController
  before_action :set_post
  def new
    @comment = @post.comments.build
  end

  def create
    @comment = @post.comments.build(comments_params)
    @comment.user = current_user
    @post.number_of_comments += 1

    if @comment.save && @post.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect to @post }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    decrease_comment_count
    @comment.destroy!
    redirect_to @post, status: :see_other, notice: "Successfully removed"
  end

  def decrease_comment_count
    @post.number_of_comments = (@post&.number_of_comments - 1).clamp(0..)
    @post.save
  end



  private

  # find the post once so post.find does not have to be called each time
  def set_post
    @post = Post.find(params[:post_id])
  end

  def comments_params
    params.require(:comment).permit(:content)
  end
end
