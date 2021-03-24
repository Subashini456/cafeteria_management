class AddTotalOrderToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :total_order, :integer
  end
end
