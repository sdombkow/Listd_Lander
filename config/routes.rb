ListdApp::Application.routes.draw do
  resources :potential_customers

  root :to => "home#index"
	
end