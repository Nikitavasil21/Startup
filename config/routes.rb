Startup::Application.routes.draw do
  root :to => "home#index"
  resources :cards
end
