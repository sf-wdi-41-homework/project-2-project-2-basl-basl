class ProfileController < ApplicationController

  def index
    puts "I'M BEING CALLED!"
    @my_recipes = UserRecipe.where(user_id:current_user.id)
    puts "My RECIPES: #{@my_recipes}"
    @recipe_list = []
    @my_recipes.each do |favs|
      @recipe_list << Recipe.find(favs.recipe_id)
    end
    puts "RECIPE LIST:#{@recipe_list}"
  end

end
