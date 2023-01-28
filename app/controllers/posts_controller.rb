class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: params[:id])
  end

  def new
    post = Post.new

    respond_to do |format|
      format.html { render :new, locals: { post: post } }
    end
  end

  def create
    post = Post.new(post_params)
    post.author_id = current_user.id

    if post.save
      flash[:notice] = "Post created successfully"
      redirect_to user_posts_url(post.author_id)
    else
      flash.now[:errors] = post.errors.full_messages
      render :new
    end
  end
end
