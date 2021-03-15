class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "users/new"
  end

  def create
    user = User.new(
      name: params[:name],
      role: params[:role],
      email: params[:email],
      password: params[:password],
    )
    if user.save
      redirect_to "/"
    else
      flash[:error] = "Your Signup attempt has failed. Please try again "
      redirect_to new_user_path
    end
  end
end
