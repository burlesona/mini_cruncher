MiniCruncher::Application.routes.draw do
  resource :home, :only => :show
  resource :admin, :only => :show

  resources :clients do
  	post 'lookup', :on => :collection
  end
  resources :tests
  resources :questions
  root :to => "home#show"
end