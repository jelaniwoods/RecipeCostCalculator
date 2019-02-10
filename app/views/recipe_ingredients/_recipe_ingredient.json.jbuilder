# frozen_string_literal: true

json.extract! recipe_ingredient, :id, :recipe_id, :name, :units, :quantity, :created_at, :updated_at
json.url recipe_ingredient_url(recipe_ingredient, format: :json)
