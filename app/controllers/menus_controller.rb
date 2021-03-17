class MenusController < ApplicationController
  def index
    #render plain: Menu.all.map { |menu| menu.to_pleasent_string }.join("\n")
    render "index"
  end

  def create
    name = params[:name]
    description = params[:description]
    menu_category = params[:menu_category]
    price = params[:price]
    new_menu = Menu.new(
      name: name,
      description: description,
      menu_category: menu_category,
      price: price,
    )
    if new_menu.save
      redirect_to menus_path
    else
      flash[:error] = new_menu.errors.full_messages.join(", ")
      redirect_to menus_path
    end
  end

  def destroy
    id = params[:id]
    dmenu = Menu.find(id)
    dmenu.destroy
    redirect_to menus_path
  end
end
