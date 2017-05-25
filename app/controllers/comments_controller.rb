class CommentsController < ApplicationController
	before_action :authenticate_user!
	def create
		@recipe = Recipe.find(params[:recipe_id])
		@comment = Comment.create(params[:comment].permit(:content))
		@comment.user_id = current_user.id
		@comment.recipe_id = @recipe.id

		if @comment.save
			redirect_to recipe_path(@recipe)
		else
			render 'new'
		end
	end
end