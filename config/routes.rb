Rails.application.routes.draw do
  resources :customers

  root :to => "customers#index"
  get "market" => "customers#edit_all"
  patch "market" => "customers#update_all"

  get ":slug" => "customers#show_self"
end
