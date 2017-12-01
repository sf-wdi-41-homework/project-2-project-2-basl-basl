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
    puts "#{params}"
    puts "RECIPE ID #{params["recipe_id"]}"
    puts "RECIPE TITLE #{params["recipe_title"]}"
    recipe_title = "#{params["recipe_title"]}"
    puts "USER ID: #{current_user.id}"
    Recipe.find_or_create_by(title:"#{params["recipe_title"]}")
    new_recipe = Recipe.find_by_title("#{params["recipe_title"]}")
    current_user.recipes << new_recipe

   #  second db call, does find_or_create_by for the current_user id and recipe id (NOT api id)
   redirect_to('/profile')
  end

end
