Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:show, :edit]
  resources :wikis

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
