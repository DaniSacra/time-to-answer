Rails.application.routes.draw do
  
  namespace :admins_backoffice do
    get 'questions/index'
  end
  namespace :admins_backoffice do
    get 'subjects/index'
  end
  namespace :users_backoffice do
    get 'welcome/index'
  end

  devise_for :users
  
  namespace :site do
    get 'welcome/index'
  end
  
  namespace :admins_backoffice do
    get 'welcome/index'
    resources :admins
    resources :subjects
  end
  
  devise_for :admins

  get 'inicio', to: 'site/welcome#index'
  
  root to: 'site/welcome#index'
  
end
