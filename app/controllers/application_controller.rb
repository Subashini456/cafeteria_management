class ApplicationController < ActionController::Base
  before_action :ensure_user_logged_in
  include ApplicationHelper

  def ensure_user_logged_in
    unless current_user
      redirect_to "/"
    end
  end
end
