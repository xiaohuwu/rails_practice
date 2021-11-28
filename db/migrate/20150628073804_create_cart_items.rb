class CreateCartItems < ActiveRecord::Migration[5.1]
  def change
    create_table :cart_items do |t|
      t.references :user
      t.references :variant
      t.integer :quantity, default: 0

      t.timestamps null: false
    end
  end
end
