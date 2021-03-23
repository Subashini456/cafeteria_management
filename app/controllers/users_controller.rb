class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "users/new"
  end

  def create
    user = User.new(create_user)
    create_error(user)
  end

  private

  def create_user
    params.permit(:name, :role, :email, :password)
  end

  private

  def create_error(user)
    if user.save
      redirect_to "/"
    else
      flash[:error] = user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end
end
