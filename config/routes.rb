ListdApp::Application.routes.draw do
  resources :potential_customers

  resources :leads

  root :to => "home#index"
	
end