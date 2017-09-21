class AddRefernceAdminToCamps < ActiveRecord::Migration[5.1]
  def change
    add_reference :camps, :admin, index: true, foreign_key: true
  end
end
