Rails.application.routes.draw do
  namespace :authentication, path: '', as: '' do
    resources :sessions, only: [:new, :create, :destroy], path: '/login', path_names: { new: '/' }
  end

  resources :queries, only: [:index]
  resources :users, except: :show
  resources :beneficiaries, except: :show
  resources :deliveries, except: :show
  root "dashboard#index"
end
