class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
    @like = Like.new(like_params)
    @like.liker_id = current_user.id
    @like.post_id = @post.id

    if @like.save
      redirect_to user_post_url(@user, @post)
    else
      flash.now[:errors] = @like.errors.full_messages
      render :new
    end
  end
end
