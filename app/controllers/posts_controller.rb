class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  end

  def new
  end

  def create
  	@post = Post.new(params[:post])
  	@post.user_id = 1
  	if @post.save
  		flash[:notice] = "Post was created!"
  		redirect_to post_path(@post)
  	else
  		flash[:notice] = "Invalid Post :("
  		redirect_to new_post_path
  	end
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
