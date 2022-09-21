Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about'=>'homes#about'
  resources :users, only: [:show, :index, :create, :edit, :update, :delete]
  resources :books, only: [:new, :index, :show, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
