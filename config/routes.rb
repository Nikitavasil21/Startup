Startup::Application.routes.draw do
  root :to => "home#index"
  resources :cards
  put "review" => "home#review_card"
end
