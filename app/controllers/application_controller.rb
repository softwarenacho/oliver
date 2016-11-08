class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def admin_user
    flash[:danger] = "No tienes los permisos necesarios para acceder a esta sección" unless current_user.admin?
    redirect_to(root_url) unless current_user.admin?
  end
  def correct_user
    flash[:danger] = "No tienes los permisos necesarios para acceder a esta sección" unless current_user.id == params[:id]
    redirect_to(root_url) unless current_user.id == params[:id]
  end
  def current_user
    User.find session[:user_id]
  end
end
