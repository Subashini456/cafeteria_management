module ApplicationHelper
  def current_order
    if Order.where(:user_id => current_user.id).exists? && !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new(user_id: current_user.id, status: "Unplaced Order")
    end
  end

  def current_user
    return @current_user if @current_user

    current_user_id = session[:current_user_id]
    if current_user_id
      @current_user = User.find(current_user_id)
    else
      nil
    end
  end
end
