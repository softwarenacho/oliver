class SessionsController < ApplicationController

  def login
    redirect_to home_path if session[:user_id]
  end

  def create
    user = User.find_by_username params[:session][:username].downcase
    unless user && user.authenticate(params[:session][:password])
      flash[:success] = "Bienvenido, es hora de compartir"
      session[:user_id] = user.id
      redirect_to root_url
    else
      flash[:danger] = "No se pudo iniciar la sesión"
      render 'login'
    end
  end

  def logout
    flash[:success] = 'Hasta luego, regresa pronto'
    session.clear
    redirect_to root_path
  end

end
