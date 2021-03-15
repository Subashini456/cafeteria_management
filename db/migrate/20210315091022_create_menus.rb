class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.string :name
      t.text :description
      t.float :price

      t.timestamps
    end
  end
end
