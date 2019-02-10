# frozen_string_literal: true

class CreateShoplists < ActiveRecord::Migration[5.2]
  def change
    create_table :shoplists do |t|
      t.integer :recipe_id
      t.string :name

      t.timestamps
    end
  end
end
