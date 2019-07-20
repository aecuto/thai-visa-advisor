Rails.application.routes.draw do

  resources :notices
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'home#index'

  devise_for :admins
  devise_for :users

  resources :organizations do
    resources :families do 
      resources :members
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
