Rails.application.routes.draw do
  get 'book_comments/create'
  get 'book_comments/destroy'
  devise_for :users
  root to: 'homes#top'
  get 'home/about'=>'homes#about'
  resources :users, only: [:show, :index, :create, :edit, :update, :delete]
  resources :books, only: [:new, :index, :show, :create, :edit, :update, :destroy] do
   resources :book_commnets, only: [:create, :destroy]
   resource :favorites, only: [:create, :delete]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

