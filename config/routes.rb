Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:show, :edit] do
    resources :wikis, shallow: true
  end

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
