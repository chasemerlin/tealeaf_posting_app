class CategoriesController < ApplicationController
	#Need before filter

	def show
		@category = Category.find(params[:id])
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(params[:category])
		if @category.save
			flash[:notice] = "Added a New Category!"
			redirect_to posts_path
		else
			render 'new'
		end
	end
end