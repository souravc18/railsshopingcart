Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
 
  get 'carts/show'
  resources :products

  resources :shops do
    get 'send_mail', on: :collection 
  end
  resources :order_items
  resource :carts, only:[:show]
  root 'shops#index'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
