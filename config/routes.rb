Startup::Application.routes.draw do
  
  get 'profile' => 'profile#edit'
  patch 'profile' => 'profile#update'
  

  resources :user_sessions
  resources :users

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout


  root :to => "home#index"
  resources :cards
  put "review" => "home#review_card"
end
