Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:show, :edit] do
    resources :wikis
  end

  root to: 'welcome#index'

end
