class MenusController < ApplicationController
  def index
    @menus = Menu.all
    @order_food = current_order.order_foods.new
    #render plain: Menu.all.map { |menu| menu.to_pleasent_string }.join("\n")
    render "index"
  end

  def new
  end

  def show
    menu_id = Menu.find(params[:id])
    @menus = Menu.where(:id => menu_id)
  end

  def create
    new_menu = Menu.new(create_menu)
    error_condition(new_menu)
  end

  def update
    up_menu = Menu.find(params[:id])
    up_menu.price = params[:price]
    up_menu.description = params[:description]
    error_condition(up_menu)
  end

  def destroy
    dmenu = Menu.find(params[:id])
    dmenu.destroy
    redirect_to menus_path
  end

  private

  def create_menu
    params.permit(:name, :description, :menu_category, :price)
  end

  private

  def error_condition(menu)
    if menu.save
      redirect_to menus_path
    else
      flash[:error] = menu.errors.full_messages.join(", ")
      redirect_to menus_path
    end
  end
end
