class AddColumnToRatings < ActiveRecord::Migration[5.1]
  def change
    add_column :ratings, :name, :string
    add_column :ratings, :email, :string 
  end
end
