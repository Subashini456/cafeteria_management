class AddAvailabilityStatusToMenus < ActiveRecord::Migration[6.1]
  def change
    add_column :menus, :availability_status, :string
  end
end
