class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def followings
    @user = User.find(params[:id])
    @followings = @user.following_user
  end

  def followers
    @user = User.find(params[:id])
    @followers = @user.follower_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
