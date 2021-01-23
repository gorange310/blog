class CommentsController < ApplicationController
  before_action :require_user, only: [:create]

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
    comment = Comment.find(params[:id])
    comment.destroy
    flash[:notice] = "comment was destroyed."
    redirect_to comment.post
  end

  private
  def comment_params
    user_id = current_user.id
    params.require(:comment).permit(:content, :user_id, :post_id)
  end

end
