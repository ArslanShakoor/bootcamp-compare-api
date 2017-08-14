class AddUsersToCamps < ActiveRecord::Migration[5.1]
  def change
  	add_reference :camps, :user, index: true, foreign_key: true
  end
end
