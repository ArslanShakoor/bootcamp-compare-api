class AddCoulmnsToRatings < ActiveRecord::Migration[5.1]
  def change
    add_column :ratings, :occupation, :string
  end
end
