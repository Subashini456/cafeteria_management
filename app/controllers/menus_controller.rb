class MenusController < ApplicationController
  def index
    #render plain: Menu.all.map { |menu| menu.to_pleasent_string }.join("\n")
    render "index"
  end
end
