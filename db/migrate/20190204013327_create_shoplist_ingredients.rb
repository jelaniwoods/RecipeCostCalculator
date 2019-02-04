class CreateShoplistIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :shoplist_ingredients do |t|
      t.integer :shoplist_id
      t.float :price
      t.string :name
      t.float :quantity
      t.string :units
      t.timestamps
    end
  end
end
