class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
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
    @comment = Comment.new
    @comments = @post.comments.order(id: :desc)
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

  def search
    @keyword = params[:keyword]
    @posts = Post.search(@keyword).paginate(page: params[:page], per_page: 5).order(id: :desc)
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, category_ids: [])
  end

  def set_post
    @post = Post.find(params["id"])
  end

  def require_same_user
    if current_user != @post.user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own article"
      redirect_to @post
    end
  end
  
end
