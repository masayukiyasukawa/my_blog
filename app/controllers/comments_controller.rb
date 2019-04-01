class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post.comments.create(comment_params)
    flash[:success] = 'commentを投稿しました'
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    flash[:danger] = 'commentをdestroyしました'
    redirect_to post_path(@post)
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end

end
