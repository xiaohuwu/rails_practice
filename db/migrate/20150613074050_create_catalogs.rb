class CreateCatalogs < ActiveRecord::Migration[5.1]
  def change
    create_table :catalogs do |t|
      t.references :parent_catalog, index: true, foreign_key: true
      t.string :name
      t.boolean :parent

      t.timestamps null: false
    end
  end
end
