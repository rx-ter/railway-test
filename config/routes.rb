Rails.application.routes.draw do

  resources :admins
  root to: "home#index"
  
  resources :trains do
  end
  get 'search', to: "trains#search"

  resources :stations
  resources :transactions 
  post '/buy_ticket_form', to: 'transactions#buy_ticket_form'
  post '/buy_ticket', to: 'transactions#buy_ticket'

  resources :train_routes
  
  resources :home, only: [:index] do
    get :autocomplete_station_name, on: :collection
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
