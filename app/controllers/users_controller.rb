class UsersController < ApplicationController

  before_action :baria_user, only: [:edit]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc).page(params[:page]).per(12)
  end

  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "You have updated user successfully."
       redirect_to user_path(@user.id)
    else
       render :edit
    end
  end

  def followings
    @user = User.find(params[:id])
    @followings = @user.following_user.all.page(params[:page]).per(10)
  end

  def followers
    @user = User.find(params[:id])
    @followers = @user.follower_user.all.page(params[:page]).per(10)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def baria_user
      user = User.find(params[:id])
      if user != current_user
      redirect_to user_path(current_user)
      end
  end

end
