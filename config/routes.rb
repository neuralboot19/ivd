Rails.application.routes.draw do
  namespace :authentication, path: '', as: '' do
    resources :sessions, only: [:new, :create, :destroy], path: '/login', path_names: { new: '/' }
  end

  root "dashboard#index"
end
