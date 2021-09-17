class PostsController < ApplicationController
  before_action: only: [edit, update, destroy]
  def index
    @post = Post.new
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_index_path, notice: "Your post has succesfully been created!"
    else
      render :index
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end

  def set_params
    @post = Post.find(params[:id])
  end
end
