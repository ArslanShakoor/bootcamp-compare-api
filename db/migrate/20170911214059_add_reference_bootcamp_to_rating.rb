class AddReferenceBootcampToRating < ActiveRecord::Migration[5.1]
  def change
  	add_reference :ratings, :camp, foreign_key: true, index: true
  end
end
