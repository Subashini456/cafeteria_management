class CreateOrderfoods < ActiveRecord::Migration[6.1]
  def change
    create_table :orderfoods do |t|
      t.bigint :order_id
      t.bigint :menu_id
      t.float :unit_price
      t.integer :quantity

      t.timestamps
    end
  end
end
