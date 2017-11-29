class Recipe < ApplicationRecord
  has_many :users, :through => :UserRecipe
end
