class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all.sort_by{ |likes| likes.thumbs_up_total }.reverse
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = Chef.find(1)

    if @recipe.save
      flash[:success] = "Recipe was created successfully"
      redirect_to recipes_path
    else
      render :new
    end

  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update(recipe_params)
      flash[:success] = "Recipe was updated successfully"
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def like
    @recipe = Recipe.find(params[:id])
    like = Like.create(likes: params[:likes], chef: Chef.first, recipe: @recipe)
    if like.valid?
      flash[:success] = "Your selection was recorded"
      redirect_to :back
    else
      flash[:danger] = "You can only like/dislike a recipe once"
      redirect_to :back
    end
  end

  private

    def recipe_params
      params.require(:recipe).permit(:name, :summary, :description, :picture)
    end

end