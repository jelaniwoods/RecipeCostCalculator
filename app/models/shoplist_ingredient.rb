# frozen_string_literal: true

# == Schema Information
#
# Table name: shoplist_ingredients
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  price       :float
#  quantity    :string
#  units       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  shoplist_id :integer
#

class ShoplistIngredient < ApplicationRecord
  belongs_to :shoplist

  has_one :recipe_ingredient, through: :shoplist, source: :recipe_ingredient
  has_one :recipe, through: :recipe_ingredient, source: :recipe
end
