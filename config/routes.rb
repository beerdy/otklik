Rails.application.routes.draw do
  devise_for :users
  
  resources :messages
  resources :contents
  
  get 'welcome/index'
  root 'welcome#index'
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  scope '/api_chats' do
    resources :telegrams do
      collection do
        post :web_hook_proxy
        post :send_message
      end
    end
  end
  
end
