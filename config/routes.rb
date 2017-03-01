Rails.application.routes.draw do
  resources :companies
  resources :email_addresses
  resources :phone_numbers, :except => [:index, :show]
  resources :people

  get '/auth/:provider/callback' => 'sessions#create'
  root to: 'site#index'

  resource :sessions, :only => [:create]
  get "/login" => redirect("/auth/twitter"), as: :login
  delete "/logout" => "sessions#destroy", as: :logout

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
