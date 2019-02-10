# frozen_string_literal: true

class CreateRecipeIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_ingredients do |t|
      t.integer :recipe_id
      t.string :name
      t.string :units
      t.string :quantity

      t.timestamps
    end
  end
end
