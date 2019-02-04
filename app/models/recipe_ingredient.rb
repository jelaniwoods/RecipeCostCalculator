# == Schema Information
#
# Table name: recipe_ingredients
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  recipe_id  :integer
#

class RecipeIngredient < ApplicationRecord

  belongs_to :recipe


  has_one :shoplist, :through => :recipe, :source => :shoplist
  has_one :shoplist_ingredient, :through => :shoplist, :source => :shoplistingredients

end
