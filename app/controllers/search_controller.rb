class SearchController < ApplicationController

  def search
    @user_or_hashname = params[:option]
    @how_search = params[:choice]
    if @user_or_hashname == "1"
      @users = User.search(params[:search], @user_or_hashname, @how_search).page(params[:page]).per(10)
    else
      @hashnames = Hashtag.search(params[:search], @user_or_hashname, @how_search)
      @posts = Post.where(id: @hashnames.first.posts.ids).order(created_at: :desc).page(params[:page]).per(12)
      # [ 4, 5 ]
      #if @how_serch == ""
      #  @posts = Post.where(id: Hashtag.all.posts.ids)
      #end
    end
  end

  def searching
  end

end
