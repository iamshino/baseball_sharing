Rails.application.routes.draw do
  resources :tags
  get '/mypage', to: 'mypage#show'
  devise_for :users
  root to: 'articles#index'
  resources :articles do
    collection do
      get 'search'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
