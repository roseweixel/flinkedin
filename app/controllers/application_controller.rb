class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :login, :logout

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def login
    session[:user_id] = @user.id
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Goodbye!"
  end

  def require_login
    if !current_user
      flash[:alert] = "Please sign in to continue!"
      redirect_to root_path
    end
  end

  def require_user_is_current_user
    if @user != current_user
      flash[:alert] = "Access Denied!"
      redirect_to root_path
    end
  end

end
