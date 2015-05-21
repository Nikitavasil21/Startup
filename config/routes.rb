Startup::Application.routes.draw do

  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback" 
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

  resource :profiles, only: [:edit, :update]  

  resources :user_sessions
  resources :users

  resources :decks

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  get 'home' => "home#index"

  put 'decks' => 'profiles#set_current_deck', :as => :set_current_deck


  root :to => "user_sessions#new"
  resources :cards
  put "review" => "home#review_card"
end
