class AddOwnerReferenceToUserRecipes < ActiveRecord::Migration[5.1]
  def change
    add_reference :user_recipes, :recipe, foreign_key: true
  end
end
