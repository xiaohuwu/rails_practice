class CreatePostAuthorings < ActiveRecord::Migration[5.1]
  def change
    create_table :post_authorings do |t|
      t.integer :authored_post_id
      t.integer :post_author_id

      t.timestamps
    end
  end
end
