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
  puts response.count 

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
    Recipe.find_or_create_by(title:"#{params["recipe_title"]}")
    new_recipe = Recipe.find_by_title("#{params["recipe_title"]}")
    current_user.recipes << new_recipe
    redirect_to('/profile')
  end

end
