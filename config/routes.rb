Startup::Application.routes.draw do
  root :to => "home#index"
  resources :cards
  put "home" => "home#task"
end
