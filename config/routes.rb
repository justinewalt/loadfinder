Rails.application.routes.draw do
  root "pages#show", page: "home"

  devise_for :users, controllers: {
       sessions: 'users/sessions',
       registrations: 'users/registrations'
     }

  # GET
  get "/pages/:page" => "pages#show"

  resources :jobs do
    resources :bids
  end
end
