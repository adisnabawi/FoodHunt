class RecipesController < ApplicationController
	before_action :find_recipe, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		## perform a paginated query:
		@recipe = Recipe.paginate(:page => params[:page], :per_page => 9).order('created_at DESC')
		
		##@recipe = Recipe.all.order('created_at DESC')
	end

	def show
	end

	def new
		@recipe = current_user.recipes.build
	end

	def create
		@recipe = current_user.recipes.build(recipe_params)
		if @recipe.save
			PostMailer.post_created(current_user).deliver
			redirect_to @recipe, notice: "Successfully created new restaurant"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @recipe.update(recipe_params)
			redirect_to @recipe
		else
			render 'edit'
		end
	end

	def destroy
		@recipe.destroy
		redirect_to root_path, notice: "Successfully deleted restaurant"
	end

	private

	def recipe_params
		params.require(:recipe).permit(:title, :description, :image, ingredients_attributes: [:id, :name, :_destroy], directions_attributes: [:id, :step, :_destroy])
	end

	def find_recipe
		@recipe = Recipe.find(params[:id])
		@comments = @recipe.comments.all
		@comment = @recipe.comments.build
	end
end
