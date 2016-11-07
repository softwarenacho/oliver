class UsersController < ApplicationController

  before_action :admin_user, only: [:new, :create, :destroy]
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
        flash[:success] = "Usuario creado exitosamente"
        redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.new
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes(user_params)
      flash[:success] = "Actualización exitosa"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Usuario eliminado"
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :admin, :photo, :password, :password_confirmation, :user_name)
  end
end
