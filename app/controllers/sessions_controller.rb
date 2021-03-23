class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    session_error(user)
  end

  def destroy
    session[:current_user_id] = nil
    session[:order_id] = nil
    redirect_to "/"
  end

  private

  def session_error(user)
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to "/"
    else
      flash[:error] = "Your login attempt is invalid. Try again"
      redirect_to new_sessions_path
    end
  end
end
