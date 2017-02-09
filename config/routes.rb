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

  get 'shipper', to: 'shippers#home', as: 'shipper'
  get 'haulier', to: 'hauliers#home', as: 'haulier'
end
