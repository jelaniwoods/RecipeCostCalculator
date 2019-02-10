# frozen_string_literal: true

json.extract! recipe, :id, :user_id, :name, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
