class AddOrdersCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :orders_count, :integer
  end
end
