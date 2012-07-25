MiniCruncher::Application.routes.draw do

  resource :home, :only => :show
  resource :admin, :only => :show

  resources :clients, :except => [:edit] do
  	post 'lookup', :on => :collection
  end
	resources :master_tests
  resources :assignments

  root :to => "home#show"
end