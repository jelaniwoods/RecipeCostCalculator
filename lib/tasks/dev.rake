require "faker"
namespace :dev do
  desc "Add dummy data"
  task prime: :environment do
    User.destroy_all
    Recipe.destroy_all
    RecipeIngredient.destroy_all
    Shoplist.destroy_all
    ShoplistIngredient.destroy_all
    puts "3 users created"
    User.create([
      { email: "admin@example.com", password: "password" },
      { email: "alice@example.com", password: "password"},
      { email: "bob@example.com", password: "password"},
    ])

    ingredients = []
    units = []
    quantities = []

    (0..10).each do |n|
      units.push(Faker::Food.measurement)
      ingredients.push(Faker::Food.ingredient)
      quantities.push(rand(1..4)/rand(1..4))
    end
    recipes = []
    (0..5).each do |n|
      recipe = Recipe.create(name: Faker::Food.dish)
      recipes.push(recipe)
      shoplist = Shoplist.create(name: recipe.name, recipe_id: recipe.id)
    end
    (1..Recipe.all.size).each do |n|
      recipe = Recipe.find(n)
      shoplist = recipe.shoplist
      i = ingredients.sample
      q = quantities.sample
      u = units.sample
      recipe.ingredients.create(name: i, quantity: q, units: u)
      shoplist.ingredients.create(name: i, quantity: q, units: u)
    end
    puts "Added 5 recipes and shoplists"

  end

end
