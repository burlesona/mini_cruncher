MiniCruncher::Application.routes.draw do

  resource :home, :only => :show
  resource :admin, :only => :show

  resources :clients, :except => [:edit] do
  	post 'lookup', :on => :collection
  end
	resources :master_tests
  resources :tests

  root :to => "home#show"
end