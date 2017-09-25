class DropTableAdmins < ActiveRecord::Migration[5.1]
  def change
    remove_column :camps, :admin_id
  end
end
