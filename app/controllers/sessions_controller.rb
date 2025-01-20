class SessionsController < ApplicationController
  def new
    # Affiche le formulaire de connexion
  end

  def create
    username = params[:username]
    password = params[:password]

    if username == "Admin" && password == "Yut53!"
      redirect_to success_path  
    else
      flash.now[:alert] = "Invalid username or password"
      render :new
    end
  end
end
