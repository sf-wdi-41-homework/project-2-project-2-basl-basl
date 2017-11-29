require 'httparty'

class MainController < ApplicationController
  @@mashape_key = ENV["MASHAPEKEY"]

  def get_recipe
    puts "KEY #{@@mashape_key}"
    puts params[:search]
    passed_ingredient = params[:search]
    puts passed_ingredient
    response = HTTParty.get "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/findByIngredients?fillIngredients=true&ingredients=#{passed_ingredient}&instructionsRequired=true&limitLicense=false&number=5&ranking=1",
    headers:{
      "X-Mashape-Key" => @@mashape_key,
      "Accept" => "application/json"
    }
    # puts ENV["MASHAPEKEY"]
    @response = response
    puts response
    render('results')
  end

end
