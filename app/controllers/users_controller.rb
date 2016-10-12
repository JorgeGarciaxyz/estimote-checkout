class UsersController < ApplicationController

  before_action :set_user, only: [:edit]

  def index
    @users = User.all.order(:last_name)
  end

  def edit
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

end
