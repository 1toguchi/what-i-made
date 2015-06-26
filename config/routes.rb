Rails.application.routes.draw do
  root "top#index"
  resources :sessions
  resources :users do
  	resources :hours
  end
  resources :hours
  delete "logout" => "sessions#destroy"
  match "sessions/destroy", :via => :delete
  match "sessions/create", :via => :post
  get "about" => "top#about", as: "about"
  get "show" => "users#show", as: "show"
  get "new" => "hours#new", as: "hours_new"
  get "rank" => "hours#rank", as: "rank"

end
