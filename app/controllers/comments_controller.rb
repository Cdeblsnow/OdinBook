class CommentsController < ApplicationController
  before_action :set_post
  def new
    @comment = @post.comments.build
  end

  def create
    @comment = @post.comments.build(comments_params)

    if @comment.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect to @post }
      end
    else
      render :new, status: :unprocessable_entity
    end
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
