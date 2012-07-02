MiniCruncher::Application.routes.draw do
  resource :home, :only => :show
  resource :admin, :only => :show

  resources :clients
  resources :tests
  resources :questions
  root :to => "home#show"
end