class CommentsController < ApplicationController
  before_action :require_same_user, only: [:destroy]
  before_action :require_user, only: [:create, :destroy]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.guest = current_user
    if @comment.save
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  def destroy
    @comment.destroy
    flash[:notice] = "comment was destroyed."
    redirect_to @comment.post
  end

  private
  def comment_params
    guest_id = current_user.id
    params.require(:comment).permit(:content, :guest_id, :post_id)
  end

  def require_same_user
    @comment = Comment.find(params[:id])
    if current_user != @comment.post.user && !current_user.admin?
      flash[:alert] = "Only the post owner or admins can delete it"
      redirect_to @comment.post
    end
  end

end
