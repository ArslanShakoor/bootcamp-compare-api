Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
	  resources :camps
	  resource :sessions, only: [:create, :destroy] 
	  resource :user, only: [:create], :defaults => { :format => 'json' }
  
end
