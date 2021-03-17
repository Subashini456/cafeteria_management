class AddSubtotalToOrderfoods < ActiveRecord::Migration[6.1]
  def change
    add_column :orderfoods, :subtotal, :float
  end
end
