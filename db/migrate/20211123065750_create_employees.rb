class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :age
      t.references :manager
      t.timestamps
    end
  end
end
