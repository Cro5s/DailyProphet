class Api::SessionsController < ApplicationController
  def new
    # Renders the login form
  end

  def index; end

  def create
    @user = User.find_credentials_by(params[:user][:username], params[:user][:password])

    if @user
      login!(@user)
      flash[:success] = 'Logged in Successfully!'
      render 'users/show'
    else
      flash.now[:alert] = 'Invalid username or password.'
      render :new
    end
  end

  def destroy
    logout!
    redirect_to root_path, notice: 'Logged out Successfully!'
  end
end
