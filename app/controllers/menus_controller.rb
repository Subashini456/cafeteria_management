class MenusController < ApplicationController
  def index
    @menus = Menu.all
    @orderfood = current_order.orderfoods.new
    #render plain: Menu.all.map { |menu| menu.to_pleasent_string }.join("\n")
    render "index"
  end

  def create
    new_menu = Menu.new(create_menu)
    if new_menu.save
      redirect_to menus_path
    else
      flash[:error] = new_menu.errors.full_messages.join(", ")
      redirect_to menus_path
    end
  end

  def update
  end

  def destroy
    dmenu = Menu.find(params[:id])
    dmenu.destroy
    redirect_to menus_path
  end

  def create_menu
    params.permit(:name, :description, :menu_category, :price)
  end
end
