class FixColumnName < ActiveRecord::Migration[5.1]
  def change
  	rename_column :camps, :webiste, :website
  end
end
