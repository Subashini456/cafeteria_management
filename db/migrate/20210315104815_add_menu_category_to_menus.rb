class AddMenuCategoryToMenus < ActiveRecord::Migration[6.1]
  def change
    add_column :menus, :menu_category, :string
  end
end
