Rails.application.routes.draw do
  root "pages#show", page: "home"
  devise_for :users

  devise_for :users, controllers: {
       sessions: 'users/sessions'
     }

  # GET
  get "/pages/:page" => "pages#show"

  resources :users

  resources :jobs do
    resources :bids
  end
end
