class MenusController < ApplicationController
  def index
    @menus = Menu.all
    @order_food = current_order.order_foods.new
    #render plain: Menu.all.map { |menu| menu.to_pleasent_string }.join("\n")
    render "index"
  end

  def new
    render "menus/new"
  end

  def show
    @menus = Menu.where(:id => Menu.find(params[:id]))
  end

  def create
    new_menu = Menu.new(menu_params)
    check_save_condition(new_menu)
  end

  def update
    up_menu = Menu.find(params[:id])
    up_menu.update(menu_params)
    check_save_condition(up_menu)
  end

  def destroy
    Menu.find(params[:id]).destroy
    redirect_to menus_path
  end

  private

  def menu_params
    params.permit(:name, :description, :menu_category, :price)
  end

  private

  def check_save_condition(menu)
    if menu.save
      redirect_to menus_path
    else
      flash[:error] = menu.errors.full_messages.join(", ")
      redirect_to menus_path
    end
  end
end
