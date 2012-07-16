MiniCruncher::Application.routes.draw do
  resources :response_sets

  resource :home, :only => :show
  resource :admin, :only => :show

  resources :clients do
  	post 'lookup', :on => :collection
  end
  resources :tests
  resources :questions
  root :to => "home#show"
end