class Recipe < ApplicationRecord
  has_many :UserRecipe, dependent: :destroy
  has_many :users, :through => :UserRecipe
end
