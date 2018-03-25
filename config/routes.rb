Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users
  
  resources :hokkaidos, only: [:index, :show, :count] , shallow: true do
    resources :hokkaido_reviews, only: [:index, :new, :create, :destroy]
  end
  
  resources :touhokus, only: [:index, :show] , shallow: true do
    resources :touhoku_reviews, only: [:index, :new, :create, :destroy]
  end
  
  resources :kantous, only: [:index, :show], shallow: true do
    resources :kantou_reviews, only: [:index, :new, :create, :destroy]
  end
  
  resources :koushinetsus, only: [:index, :show], shallow: true do
    resources :koushinetsu_reviews, only: [:index, :new, :create, :destroy]
  end
  
  resources :toukais, only: [:index, :show], shallow: true do
    resources :toukai_reviews, only: [:index, :new, :create, :destroy]
  end
  
  resources :hokurikus, only: [:index, :show], shallow: true do
    resources :hokuriku_reviews, only: [:index, :new, :create, :destroy]
  end
  
  resources :kansais, only: [:index, :show], shallow: true do
    resources :kansai_reviews, only: [:index, :new, :create, :destroy]
  end
  
  resources :sanyos, only: [:index, :show], shallow: true do
    resources :sanyo_reviews, only: [:index, :new, :create, :destroy]
  end
  
  resources :sanins, only: [:index, :show], shallow: true do
    resources :sanin_reviews, only: [:index, :new, :create, :destroy]
  end
end