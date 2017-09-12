class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.string :title
      t.string :description
      t.integer :overall_review
      t.integer :curriculum_review
      t.integer :instructor_review
      t.integer :job_assistance_review
      t.integer :anonymous
      t.timestamps
    end
  end
end
