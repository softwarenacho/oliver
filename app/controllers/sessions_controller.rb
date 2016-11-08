class SessionsController < ApplicationController

  def login
    @posts = Post.all.order(created_at: :desc)
    render 'home' if session[:user_id]
  end

  def create
    user = User.find_by_username params[:session]["username"].downcase
    if user && user.authenticate(params[:session]["password"])
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
