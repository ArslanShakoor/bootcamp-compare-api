class AddRefrencesUserBootcampToRating < ActiveRecord::Migration[5.1]
  def change
  	add_reference :rating, :user, index: true, foreign_key: true
  	add_reference :rating, :camp, index: true, foreign_key: true
  end
end
