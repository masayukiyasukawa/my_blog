class PostsController < ApplicationController

  PER = 5
  def index
    @posts = Post.order(created_at: :desc).page(params[:page]).per(PER)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    # render plain: params[:post].inspect
    # save
    # @post = Post.new(params[:post])
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = 'postを投稿しました'
      # redirect
     redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:info] = 'postをchangeしました'
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:danger] = 'postをdestroyしました'
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end

end
