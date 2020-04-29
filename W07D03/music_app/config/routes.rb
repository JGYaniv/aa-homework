Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :bands, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :albums, only: [:new]
  end
  resources :albums, only: [:create, :index, :show, :edit, :update, :destroy] do
    resources :tracks, only: [:new]
  end
  resources :tracks, only: [:create, :index, :show, :edit, :update, :destroy]
end
