require "faker"
namespace :dev do
  desc "Add dummy data"
  task prime: :environment do
    User.destroy_all
    Recipe.destroy_all
    RecipeIngredient.destroy_all
    Shoplist.destroy_all
    ShoplistIngredient.destroy_all
    User.create([
      { email: "admin@example.com", password: "password", username: "Admin" },
      { email: "alice@example.com", password: "password", username: "Alice"},
      { email: "bob@example.com", password: "password", username: "Bob"},
    ])
    puts "#{User.all.size} users created"

    ingredients = []
    units = []
    quantities = []

    (0..10).each do |n|
      units.push(Faker::Food.measurement)
      ingredients.push(Faker::Food.ingredient)
      quantities.push(rand(1..4)/rand(1..4))
      puts n
      puts "." * n
    end
    recipes = []
    (0..5).each do |n|
      recipe = Recipe.create(name: Faker::Food.dish, user_id: User.last.id)
      recipes.push(recipe)
      shoplist = Shoplist.create(name: recipe.name, recipe_id: recipe.id)
    end
    (Recipe.all).each do |recipe|
      shoplist = recipe.shoplist
      i = ingredients.sample
      q = quantities.sample
      u = units.sample
      recipe.ingredients.create([
        {name: ingredients.sample, quantity: quantities.sample, units: units.sample},
        {name: ingredients.sample, quantity: quantities.sample, units: units.sample},
        {name: ingredients.sample, quantity: quantities.sample, units: units.sample},
      ])
      shoplist.ingredients.create(name: i, quantity: q, units: u)
      # puts "Added one recipe: " + Recipe.all.size
      puts "Ingredients: " + recipe.ingredients.to_s
    end
    puts "Added 5 recipes and shoplists"

  end

end
