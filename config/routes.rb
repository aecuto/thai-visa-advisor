Rails.application.routes.draw do

  root 'home#index'

  devise_for :users
  resources :notices

  get 'families/register', to: 'families#register'
  post 'families/register', to: 'families#register_confirm'
  resources :families do 
    resources :members
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
