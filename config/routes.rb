Rails.application.routes.draw do
  devise_for :users
  resources :messages
  resources :contents
  get 'welcome/index'
  root 'welcome#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
