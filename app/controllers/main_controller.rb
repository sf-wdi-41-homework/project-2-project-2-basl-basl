require 'httparty'

class MainController < ApplicationController
  @@mashape_key = ENV["MASHAPEKEY"]

 def get_recipe
    passed_ingredient = params[:search]
    response = HTTParty.get "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/findByIngredients?fillIngredients=true&ingredients=#{passed_ingredient}&instructionsRequired=true&limitLicense=false&number=2&ranking=1",
    headers:{
      "X-Mashape-Key" => @@mashape_key,
      "Accept" => "application/json"
    }
    # puts ENV["MASHAPEKEY"]
    @response = response


     response.each do |recipe_id|
        second_response = HTTParty.get "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/#{recipe_id["id"]}/information?includeNutrition=false",
        headers:{
          "X-Mashape-Key" => @@mashape_key,
          "Accept" => "application/json"
        }

       @recipe = second_response
        puts second_response.first
      end

   render('results')
  end
end
