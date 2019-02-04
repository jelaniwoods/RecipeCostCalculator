class CreateRecipeIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_ingredients do |t|
      t.integer :recipe_id
      t.string :name
      t.float :quantity
      t.string :units
      t.timestamps
    end
  end
end
