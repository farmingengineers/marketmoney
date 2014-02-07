Rails.application.routes.draw do
  get "login" => "sessions#new"
  get "auth/google" => "sessions#omniauth", :as => :login_with_google
  post "auth/:provider/callback" => "sessions#create"

  resources :customers

  root :to => "customers#index"
  get "market" => "customers#edit_all"
  patch "market" => "customers#update_all"

  get ":slug" => "customers#show_self"
end
