class PostsController < ApplicationController
  def new
    @post = current_user.posts.build
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    p params
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path, status: :see_other
  end


  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
