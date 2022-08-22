Rails.application.routes.draw do
  resources :tags
  get '/mypage', to: 'mypage#show'
  devise_for :users
  root to: 'articles#index'
  resources :articles do
    resources :comments, only:[:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :users, only: [:index, :show]
  resources :articles, only: [:index, :show, :create] do
    resources :likes, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
