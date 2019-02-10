# frozen_string_literal: true

json.extract! shoplist_ingredient, :id, :shoplist_id, :price, :name, :units, :quantity, :created_at, :updated_at
json.url shoplist_ingredient_url(shoplist_ingredient, format: :json)
