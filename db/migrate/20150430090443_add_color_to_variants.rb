class AddColorToVariants < ActiveRecord::Migration[5.1]
  def change
    add_column :variants, :color, :string
  end
end
