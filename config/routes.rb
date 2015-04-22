Startup::Application.routes.draw do
  root :to => "home#index"
  resources :cards
  post "home" => "home#task"
end
