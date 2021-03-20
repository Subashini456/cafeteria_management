class RemoveBigintFromOrderfoods < ActiveRecord::Migration[6.1]
  def change
    remove_column :orderfoods, :bigint, :string
  end
end
