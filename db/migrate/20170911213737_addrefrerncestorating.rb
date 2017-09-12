class Addrefrerncestorating < ActiveRecord::Migration[5.1]
  def change
  	add_reference :ratings, :user, foreign_key: true, index: true
  end
end
