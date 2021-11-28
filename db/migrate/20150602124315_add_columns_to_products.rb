class AddColumnsToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :top, :boolean
    add_column :products, :hot, :boolean
  end
end
