Rails.application.routes.draw do
  root to: 'basil#index'
  resources :basil
  resources :user
  resources :sessions
  resources :profile
  resources :main
  get "/search"  => "main#get_recipe"
  get "/logout"  => "sessions#destroy"
  post "/save_recipe" => "main#save_recipe"
end
