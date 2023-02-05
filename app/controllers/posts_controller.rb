class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @current_user = current_user
    @posts = @user.posts.all.order(id: :asc).limit(3)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.includes(comments: [:author]).find(params[:id])
    @users = User.all
    @comments = @post.comments.all.reverse
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

  def destroy
    post = Post.find(params[:id])
    post.author.posts_counter -= 1
    post.destroy
    redirect_to user_posts_url(post.author_id)
  end
end
