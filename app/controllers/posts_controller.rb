class PostsController < ApplicationController
  before_action :set_index_posts
  def new
    @post = current_user.posts.build
  end

  def index
    @i_posts
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
      flash.now[:alert] = "Your post could not be saved because: #{@post.errors.full_messages.to_sentence}"
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

  def set_index_posts
    @i_post = []
    ids = set_ids
    ids.each do |u|
    @i_post.concat(Post.all.where(author_id: u).to_a)
    end
    @i_post
  end

  def set_ids
    ids = []
    current_user.following.each do |u|
      ids << u
    end
    ids.unshift(current_user.id)
    ids
  end
end
