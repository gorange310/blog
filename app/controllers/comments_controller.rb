class CommentsController < ApplicationController
  before_action :require_user, only: [:create, :destroy]
  before_action :require_same_user, only: [:destroy]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)

    if @comment.save
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to comment.post
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :commenter_id)
  end
end
