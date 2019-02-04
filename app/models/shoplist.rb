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

  belongs_to :recipe

  has_many :shoplistingredients, :class_name => "ShoplistIngredient", :dependent => :destroy

  has_one :recipe_ingredient, :through => :recipe, :source => :ingredients
end
