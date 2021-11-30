class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.integer :orders_count
      t.boolean :locked
      t.timestamps
    end
  end
end
