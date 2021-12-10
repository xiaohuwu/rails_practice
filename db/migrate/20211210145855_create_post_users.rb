class CreatePostUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :post_users do |t|
      t.string :name

      t.timestamps
    end
  end
end
