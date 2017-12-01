class ProfileController < ApplicationController

  def index
    @my_recipes = UserRecipe.where(user_id:current_user.id)
    @recipe_list = []
    @my_recipes.each do |favs|
      @recipe_list << Recipe.find(favs.recipe_id)
    end
  end

  def delete_recipe
    puts "#{params}"
    puts "RECIPE TITLE #{params["recipe_title"]}"
    puts current_user.id
    # find recipe id
    recipe_id = Recipe.where(title:"#{params["recipe_title"]}").pluck(:id)
    # destroy in UserRecipe table for current user and recipe id
    to_delete = UserRecipe.where(user_id:current_user.id,recipe_id:recipe_id)
    to_delete.destroy_all
    redirect_to('/profile')
  end

end
