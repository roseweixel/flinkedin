class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      login
      flash[:notice] = "Welcome back, #{@user.name}!"
      redirect_to user_path(@user)
    else
      flash.now[:alert] = "Invalid email or password!"
      render :new
    end
  end

  def destroy
    logout
    flash[:notice] = "Goodbye!"
    redirect_to root_path
  end
end
