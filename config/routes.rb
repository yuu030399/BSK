  
Rails.application.routes.draw do
  resources :posts
 scope module: :public do
   devise_for :admin, skip: [:registrations, :password], controllers: {
     sessions: 'admin/sessions'
   }
   devise_for :users
   get "search" => "searches#search"
   resources :reviews do
     resources :comments, only: [:create]
   end
   root to: "homes#top"
   get 'homes/about', to: 'homes#about',as:'about'
   resources :users
  end
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
    resources :comments, only: [:index,:destroy]
    resources :groups, only: [:new, :index, :show, :create, :edit, :update]
  end

end
 