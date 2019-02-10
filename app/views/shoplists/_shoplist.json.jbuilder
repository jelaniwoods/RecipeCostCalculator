# frozen_string_literal: true

json.extract! shoplist, :id, :recipe_id, :name, :created_at, :updated_at
json.url shoplist_url(shoplist, format: :json)
