class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :require_user, expect: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]


  def index
    @posts = Post.all.paginate(page: params[:page], per_page: 5).order(id: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:notice] = "Post was created successfully."
      redirect_to @post
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Post was updated successfully."
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = "Post was destroyed."
    redirect_to "/"
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end

  def set_post
    @post = Post.find(params["id"])
  end

  def require_same_user
    if current_user != @post.user
      flash[:alert] = "You can only edit or delete your own article"
      redirect_to @post
    end
  end
  
end
