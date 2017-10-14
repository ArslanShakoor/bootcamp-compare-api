Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :camps do
    collection do
      get :featured
    end
  end

  resource :sessions, only: [:create, :destroy]
  resources :ratings, only: [:index, :show, :create] do
    collection do
      get :user_camp
    end
  end
  resource :user, only: [:create], :defaults => { :format => 'json' } do
    collection do
      post 'confirm'
    end
  end

end
