ListdApp::Application.routes.draw do
  post "users/setPartner"

  post "users/unsetPartner"

  get "admin/customers"
  get "admin/partners"

  resources :admin
  get "passes/index"
  match '/mypasses' => 'passes#index'
  
  get "bars/home"
  resources :bars do
  	resources :pass_sets
    collection do
      post 'search'
    end
  end
  resources :purchases do
  	collection do
  		get 'createpurchase'
  	end
  end

  # authenticated :user do
  # root :to => 'bars#index'
  # end
  root :to => "home#index"
  
  devise_for :users
  resources :users do
	resources :bars
	end
	
end