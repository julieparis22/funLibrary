Rails.application.routes.draw do
    root 'sessions#new'  
    post '/login', to: 'sessions#create'  
    get '/success', to: 'success#show'  

    resources :books
  end