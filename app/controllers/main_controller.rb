require 'httparty'

class MainController < ApplicationController
  @@mashape_key = ENV["MASHAPEKEY"]

 def get_recipe
  passed_ingredient = params[:search]
  response = HTTParty.get "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/findByIngredients?fillIngredients=true&ingredients=#{passed_ingredient}&instructionsRequired=true&limitLicense=false&number=8&ranking=1",
  headers:{
    "X-Mashape-Key" => @@mashape_key,
    "Accept" => "application/json"
  }
  @response = response

  response.each do |recipe_id|
    second_response = HTTParty.get "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/#{recipe_id["id"]}/information?includeNutrition=false",
    headers:{
      "X-Mashape-Key" => @@mashape_key,
      "Accept" => "application/json"
    }
    @recipe = second_response

   end
   render('results')
  end

  def save_recipe
    puts "RECIPE PARAMS #{params}"
    puts "USER ID: #{current_user.id}"

   # when save recipe is clicked we need to make two db calls
   #  first db call, does find_or_create_by the recipe (1) title, (2) image url, (3) api recipe id
   #  second db call, does find_or_create_by for the current_user id and recipe id (NOT api id)
   redirect_to('/profile')
  end

end
