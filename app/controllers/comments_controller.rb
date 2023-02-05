class CommentsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params.require(:comment).permit(:text))
    @comment.author_id = current_user.id
    @comment.post_id = @post.id

    if @comment.save
      redirect_to user_post_url(@user, @post)
      flash[:success] = "Comment created successfully"
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.destroy
      redirect_to user_post_path
      flash[:success] = ["Comment deleted successfully"]
    else
      flash.now[:error] = 'Error deleting comment'
      render :show
    end
  end
end
