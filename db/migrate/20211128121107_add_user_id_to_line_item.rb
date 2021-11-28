class AddUserIdToLineItem < ActiveRecord::Migration[5.1]
  def change
    add_column :line_items,:user_id,:integer,null:false,comment: "用户Id"
  end
end
