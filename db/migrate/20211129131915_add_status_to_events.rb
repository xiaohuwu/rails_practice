class AddStatusToEvents < ActiveRecord::Migration[5.1]
  def change
   add_column :events,:status,:string
  end
end
