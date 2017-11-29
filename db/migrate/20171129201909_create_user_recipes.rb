class CreateUserRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :user_recipes do |t|

      t.timestamps
    end
  end
end
