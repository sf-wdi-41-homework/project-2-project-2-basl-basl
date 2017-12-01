class ProfileController < ApplicationController

  def index
    @my_recipes = UserRecipe.where(user_id:current_user.id)
    @recipe_list = []
    @my_recipes.each do |favs|
      @recipe_list << Recipe.find(favs.recipe_id)
    end
  end

  def delete_recipe
  end  

end
