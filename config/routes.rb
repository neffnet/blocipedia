Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :users, only: [:show, :edit] do
    post '/downgrade' => 'users#downgrade', as: :downgrade
  end

  resources :wikis
  resources :charges, only: [:new, :create]
  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
