class AddOwnerReferenceToUserRecipesFromUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :user_recipes, :user, foreign_key: true
  end
end
