Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :user_sessions

  get 'login' => 'user_sessions#new', as: :login
  post 'logout' => 'user_sessions#destroy', as: :logout

  namespace :student do
    root to: 'welcome#index'
  end

  namespace :teacher do
    root to: 'welcome#index'
  end

  namespace :custodian do
    root to: 'welcome#index'
  end

  namespace :admin do
    root to: 'welcome#index'
  end

  namespace :multirole do
    root to: 'welcome#index'
  end

  namespace :api, defaults: { format: JSON } do
    get 'school', to: 'config#school'
  end
end
