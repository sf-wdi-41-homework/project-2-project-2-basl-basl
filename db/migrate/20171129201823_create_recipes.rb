class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.integer :api_id
      t.string :picture
      t.string :title

      t.timestamps
    end
  end
end
