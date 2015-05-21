Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :users, only: [:show] do
    post '/downgrade' => 'users#downgrade'
  end

  resources :wikis
  resources :charges, only: [:new, :create]
  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
