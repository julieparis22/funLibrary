class SessionsController < ApplicationController
  def new
  
  end

  def create
    username = params[:username]
    password = params[:password]

    if username == "Admin" && password == "Paris2023!"
      redirect_to success_path  
    else
      flash.now[:alert] = "Invalid username or password"
      render :new
    end
  end
end
