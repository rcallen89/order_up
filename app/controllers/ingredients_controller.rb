class IngredientsController < ApplicationController

  def index
    if params[:chef_id]
      @ingredients = Chef.find(params[:chef_id]).chef_ingredients
    else
      @ingredients = Ingredient.all
    end
  end

end