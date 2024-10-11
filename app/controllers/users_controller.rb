class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @users = User.all
    @user = User.friendly.find(params[:id])
    @posts = @user.posts.order(id: :desc).paginate(page: params[:page], per_page: 5)
  end
end
