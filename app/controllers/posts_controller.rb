class PostsController < ApplicationController
  before_action :set_param, only: [:edit, :update, :destroy]
  def index
    @users_name_and_mail = {}
    @post = Post.new
    @posts = Post.all
    @users = User.all
    @users.each do |user|
      @users_name_and_mail[user["id"]] = [user["name"], user["email"]]
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_index_path, notice: "Your post has succesfully been created!"
    else
      render :index
    end
  end

  def edit
    @posts = Post.all
  end

  def update
    if @post.update(post_params)
      redirect_to posts_index_path, notice: "Your post has successfully been updated!"
    else
      render :index
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_index_path, notice: "Your post has succesffuly been deleted!"
  end
  
  def confirm
    @post = current_user.posts.build(post_params) 
    render :index if @post.invalid?
  end

  private
  def post_params
    params.require(:post).permit(:content, :image, :image_cache)
  end

  def set_param
    @post = Post.find(params[:id])
  end
end
