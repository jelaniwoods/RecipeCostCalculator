Rails.application.routes.draw do
  resources :shoplist_ingredients
  resources :shoplists
  resources :recipe_ingredients
  resources :recipes
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"

end
