class UsersController < ApplicationController
  def index
    @users = User.all.order(:last_name)
  end
end
