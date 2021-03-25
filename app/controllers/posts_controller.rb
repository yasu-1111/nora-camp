class PostsController < ApplicationController

  before_action :baria_user, only: [:edit]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
       flash[:notice] = "You have created book successfully"
       redirect_to post_path(@post.id)
    else
       render :new
    end
  end

  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(12)
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @post_comments = @post.post_comments
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
       flash[:notice] = "You have updated book successfully"
       redirect_to post_path(@post.id)
    else
       render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def hashtag
    @user = current_user
    @tag = Hashtag.find_by(hashname: params[:name])
    @posts = @tag.posts.order(created_at: :desc).page(params[:page]).per(12)
  end

  private

  def post_params
    params.require(:post).permit(:title, :caption, post_images_images: [])
  end

  def baria_user
      post = Post.find(params[:id])
      if post.user != current_user
      redirect_to posts_path
      end
  end

end
