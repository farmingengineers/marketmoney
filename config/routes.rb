Rails.application.routes.draw do
  get    "auth/google"             => "sessions#omniauth"
  post   "auth/:provider/callback" => "sessions#create"
  delete "auth"                    => "sessions#destroy"

  resources :customers

  root :to => "customers#index"
  get "market" => "customers#edit_all"
  patch "market" => "customers#update_all"

  get "member/:slug" => "self_service#show", :as => :self_service
end
