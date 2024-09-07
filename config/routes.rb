  
Rails.application.routes.draw do

 scope module: :public do
   devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
   namespace :admin do
    get 'dashboards', to: 'dashboards#index'
     resources :users, only: [:destroy]
  end
  devise_for :users
 get "search" => "searches#search"
  resources :reviews do
    resources :comments, only: [:create]
  end
  root to: "homes#top"
  get 'homes/about', to: 'homes#about',as:'about'
   resources :users
end

end
 