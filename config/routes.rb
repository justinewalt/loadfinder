Rails.application.routes.draw do
  root "pages#show", page: "home"

  devise_for :users, controllers: {
       sessions: 'users/sessions',
       registrations: 'users/registrations'
     }

     as :user do get '/' => 'user/jobs#index'
     end

  # GET
  get "/pages/:page" => "pages#show"

  resources :jobs do
    resources :bids
  end

  resources :jobs do
    resources :addresses
  end

  resources :bids do
    resources :addresses
  end

  resources :users do
    resources :addresses
  end

  get 'shipper', to: 'shippers#index', as: 'shipper'
  get 'haulier', to: 'hauliers#index', as: 'haulier'
end
