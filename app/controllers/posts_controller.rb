class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(params[:post])
  	@post.user_id = 1
  	if @post.save
  		flash[:notice] = "Post was created!"
  		redirect_to post_path(@post)
  	else
  		render :new
  	end
  end

  def edit
  	@post = Post.find(params[:id])
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
  end
end
