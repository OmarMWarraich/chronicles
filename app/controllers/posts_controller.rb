class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(comments: [:author])
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.includes(comments: [:author]).find(params[:id])
  end

  def new
    post = Post.new

    respond_to do |format|
      format.html { render :new, locals: { post: } }
    end
  end

  def create
    post = Post.new(params.require(:post).permit(:title, :text))
    post.author_id = current_user.id

    if post.save
      flash[:notice] = 'Post created successfully'
      redirect_to user_posts_url(post.author_id)
    else
      flash.now[:errors] = post.errors.full_messages
      render :new
    end
  end
end
