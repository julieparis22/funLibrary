Rails.application.routes.draw do
    root 'sessions#new'  
    post '/login', to: 'sessions#create'  
    get '/success', to: 'success#show'  


    resources :books, except: [:edit] # On supprime 'edit' car on veut la renommer

    # Rediriger 'edit' vers 'editBook'
    get 'books/:id/edit', to: 'books#editBook', as: 'edit_book'
      
    

  end