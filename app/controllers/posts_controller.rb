class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def create
    @post = Post.new
  end

  private

  def post_params
    params.require(:post).permit
  end
end
