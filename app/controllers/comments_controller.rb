class CommentsController < ApplicationController
  def new
    @comment = @post.comments.build
  end

  def create
    @comment = @post.comments.build(comments_params)

    if @comment.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:content)
  end
end
