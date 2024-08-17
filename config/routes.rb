Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :comments
  resources :reviews
  
  
root to: "homes#top"
get 'homes/about', to: 'homes#about',as:'about'

end

