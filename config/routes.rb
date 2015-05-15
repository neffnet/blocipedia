Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:show, :edit]
  resources :wikis
  resources :charges, only: [:new, :create]
  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
