# == Schema Information
#
# Table name: recipes
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Recipe < ApplicationRecord

  belongs_to :user
  has_many :ingredients, :class_name => "RecipeIngredient", :dependent => :destroy
  has_one :shoplist, :dependent => :destroy

  has_many :shoplist_ingredients, :through => :ingredients, :source => :shoplist_ingredient

end
