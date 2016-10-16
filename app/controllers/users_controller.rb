class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User successfully created"
      redirect_to users_path
    else
      render 'new'
    end
  end

  def index
    @users = User.all.order(:last_name)
  end

  def edit
  end

  def update
    if @user.update_without_password(user_params)
      flash[:notice] = "User successfully edited"
      redirect_to users_path
    else
      puts @user.errors.full_messages
      redirect_to root_path
    end
  end

  def destroy
    if @user.destroy
      redirect_to users_path
    else
      redirect_to users_path
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
