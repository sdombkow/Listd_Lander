ListdApp::Application.routes.draw do
  resources :leads

  root :to => "home#index"
	
end