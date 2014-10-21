Startup::Application.routes.draw do
  get "home/index"
  get "/" => "home#index"
end
