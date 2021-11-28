class AddOnHandToVariants < ActiveRecord::Migration[5.1]
  def change
    add_column :variants, :on_hand, :integer, default: 0
  end
end
