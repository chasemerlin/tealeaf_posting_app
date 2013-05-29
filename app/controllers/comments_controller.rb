class CommentsController < ApplicationController
	before_filter :require_user

	def index
		@comments = Comment.where("post_id = ?", params[:post_id])
	end

	def new
		@comment = Comment.new(post_id: params[:post_id])
	end

	def create
		@comment = Comment.new(post_id: params[:post_id], body: params[:body], user_id: current_user.id)
		if @comment.save
			flash[:notice] = "Added a New Comment!"
			redirect_to posts_path
		else
			flash[:error] = "Invalid Comment"
			redirect_to post_path(Post.find(params[:post_id]))
		end
	end

	def edit
		@comment = Comment.find(params[:id])
	end

	def update
		@comment = Comment.find(params[:id])
		if @comment.update_attributes(body: params[:body])
			flash[:notice] = "You Changed Your Comment!"
			redirect_to post_path(Post.find(params[:post_id]))
		else
			render 'edit'
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.delete
		redirect_to post_path(Post.find(params[:post_id]))
	end

	def vote
	    @comment = Comment.find(params[:comment_id])
	    Vote.create(voteable: @comment, user: current_user, vote: params[:vote])
	    
	    respond_to do |format|
	    	format.html do
	    		redirect_to posts_path
	    	end
	    	format.js do

	    	end
	    end
    end
end