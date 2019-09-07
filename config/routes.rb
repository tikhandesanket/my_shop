Rails.application.routes.draw do
  #devise_for :models
  devise_for :users
  devise_scope :user do
    root to: 'devise/sessions#new'
    get 'login', to: 'devise/sessions#new'
    delete 'logout', to: 'devise/sessions#destroy'
  end
  resources :products  do
    collection do
      get :download
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
