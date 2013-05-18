class CommentsController < ApplicationController
	def index
		@comments = Comment.where("post_id = ?", params[:post_id])
	end

	def new
		@comment = Comment.new(post_id: params[:post_id])
	end

	def create
		@comment = Comment.create(post_id: params[:post_id], body: params[:body])
		redirect_to posts_path
	end

	def edit
		@comment = Comment.find(params[:id])
	end

	def update
		binding.pry
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
end