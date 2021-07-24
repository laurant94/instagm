class UsersController < ApplicationController

  skip_before_action :only_login_in, only: [:new, :create, :confirm]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(get_params)
    if(@user.valid?)
      @user.save
      #RegisterMailer.confirm(@user).deliver_now
      redirect_to login_path, success: "Inscription effectuée avec succes. Vous recevrez un mail afin de valider votre inscription"
    else
      render 'new'
    end
  end

  def confirm
    @user = User.find(params[:id])
    if @user.present?
      @user.update_attributes(token: params[:token], validated: true)
      @user.save(validate: false)
      redirect_to register_path
    else
      render 'confirm'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    param = params.require(:user).permit(:firstname, :lastname, :avatar, :avatar_cache)
    @user.update_attributes(param)
    @user.save(validate: false)
    redirect_to profil_path, success: "Profil mis à jour avec succes"
  end

  private
  def get_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
