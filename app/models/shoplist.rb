# frozen_string_literal: true

# == Schema Information
#
# Table name: shoplists
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  recipe_id  :integer
#

class Shoplist < ApplicationRecord
  include Convert
  belongs_to :recipe

  has_many :ingredients, class_name: 'ShoplistIngredient', dependent: :destroy

  # ratio = @shoplist.items[j].amount / @recipe.ingredients[j].quantity
  # @ratio = s.amount / r.quantity
  #TODO switch statement to pick what helper to run
  #use that new ratio to get a item unit cost
  #1 create ingredients and item lists
  #2 get price and full units for items
  #3 convert units of item to match recipe ingredient units
  #4 divide ingredient quantity by item amount
  #5 multiply ratio from #4 by item cost
  #6 add
  #cost of each ingredient times the ratio amount used/amount bought
  # always convert to some unit
  def get_unit_cost
    converted_recipe = []
    converted_shoplist = []
    self.recipe.ingredients.each do |ingredient|
      temp_ingredient = Unitwise(ingredient.quantity, ingredient.units)
      converted_ingredient = temp_ingredient.convert_to("cup")
      puts converted_ingredient
    end
  end

  def build_from_recipe

  end




end
