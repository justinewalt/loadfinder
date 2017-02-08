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

  get 'shipper', to: 'shipper#home', as: 'shipper'
  get 'haulier', to: 'haulier#home', as: 'haulier'
end
