class CreateMenuCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_categories do |t|
      t.string :menu_category_name

      t.timestamps
    end
  end
end
