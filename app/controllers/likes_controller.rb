class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
    like = Like.new
    like.author = current_user
    like.post = @post

    if like.save
      redirect_to user_post_path(@user.id, @post.id)
    else
      flash.now[:errors] = @like.errors.full_messages
      render :new
    end
  end
end
