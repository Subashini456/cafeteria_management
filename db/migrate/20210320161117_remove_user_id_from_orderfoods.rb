class RemoveUserIdFromOrderfoods < ActiveRecord::Migration[6.1]
  def change
    remove_column :orderfoods, :user_id, :bigint
  end
end
