Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "ideas#index"
  get 'likes/create'
  get 'likes/destroy'
  resources :ideas do 
    resources :reviews, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end
  get 'signup', to: 'users#new'
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
end
