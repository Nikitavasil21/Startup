Startup::Application.routes.draw do

  resources :profile, only: [:edit, :update]  

  resources :user_sessions
  resources :users

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout


  root :to => "home#index"
  resources :cards
  put "review" => "home#review_card"
end
