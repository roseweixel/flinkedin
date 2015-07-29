class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      login
      redirect_to user_path(@user)
    else
      flash.now[:alert] = "Invalid email or password!"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
