MiniCruncher::Application.routes.draw do
  resource :home, :only => :show
  resources :tests
  resources :questions
  root :to => "home#show"
end