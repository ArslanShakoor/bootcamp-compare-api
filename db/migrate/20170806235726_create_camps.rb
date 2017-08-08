class CreateCamps < ActiveRecord::Migration[5.1]
  def change
    create_table :camps do |t|
      t.string :name
      t.integer :fees
      t.string :course
      t.integer :graduation_rate
      t.integer :employment_rate
      t.integer :averge_salary
      t.string :webiste
      t.string :facebook
      t.string :twitter
      t.timestamps
    end
  end
end
