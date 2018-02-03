Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users
  
  resources :hokkaidos, only: [:index, :show, :destroy] , shallow: true do
    resources :hokkaido_reviews, only: [:index, :new, :create, :destroy]
  end
  
  resources :touhokus, only: [:index, :show] , shallow: true do
    resources :touhoku_reviews, only: [:index, :new, :create, :destroy]
  end
  
  resources :kantous, only: [:index, :show], shallow: true do
    resources :kantou_reviews, only: [:index, :new, :create, :destroy]
  end
end