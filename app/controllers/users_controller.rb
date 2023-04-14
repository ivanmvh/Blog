class UsersController < ApplicationController
  def index
    p @users = User.all
    # render :index
  end

  def show
    @user = User.find(params[:id])
    render :show
  end
end
