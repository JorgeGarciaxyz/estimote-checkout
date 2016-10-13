class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update]

  def index
    @users = User.all.order(:last_name)
  end

  def edit
  end

  def update
    if @user.update_without_password(user_params)
      redirect_to users_path
    else
      puts @user.errors.full_messages
      redirect_to root_path
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :last_name, :email, :password, :password_confirmation)
    end

end
