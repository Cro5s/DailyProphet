class UsersController < ApplicationController
  before_action :ensure_logged_in

  def show
    @user = User.find(params[:id])
    render :show
  end

  def create
    @user = User.find_credentials_by(params[:user][:username], params[:user][:password])

    if @user.save
      login!(@user)
      render :show
    else
      render json: @user.errors.full_messages, status: 401
    end
  end

  private

  def user_params
    params.require.call(:user).permit(:username, :email, :password, :name)
  end
end
