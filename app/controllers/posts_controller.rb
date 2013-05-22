class PostsController < ApplicationController
  before_filter :require_user, only: [:new, :create, :edit, :update]

  def index
    @posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  end

  def new
  	@post = Post.new
    @categories = Category.all
  end

  def create
  	@post = Post.new(params[:post])
  	@post.user_id = current_user.id
  	if @post.save
  		flash[:notice] = "Post was created!"
  		redirect_to post_path(@post)
  	else
  		render :new
  	end
  end

  def edit
  	@post = Post.find(params[:id])
    @categories = @post.categories
  end

  def update
  	@post = Post.find(params[:id])
  	if @post.update_attributes(params[:post])
  		flash[:notice] = "Post Updated!"
  		redirect_to post_path(@post)
  	else
  		render 'edit'
  	end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.delete
    redirect_to posts_path
  end
end
