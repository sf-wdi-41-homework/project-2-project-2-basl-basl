require 'httparty'

class MainController < ApplicationController
  def get_recipe
    puts params[:search]
    passed_ingredient = params[:search]
    puts passed_ingredient
    response = HTTParty.get "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/findByIngredients?fillIngredients=true&ingredients=#{passed_ingredient}&instructionsRequired=true&limitLicense=false&number=5&ranking=1",
    headers:{
      "X-Mashape-Key" => "OaoFJRKD3VmshnJHG7hkIiKIcObhp1DczU9jsnkF1spZ3TCI5E",
      "Accept" => "application/json"
    }
    @response = response
    puts response
    render('results')
  end

end
