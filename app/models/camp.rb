class Camp < ApplicationRecord
	# association
	belongs_to :admin_user , foreign_key: "user_id"
	has_many :ratings, dependent: :destroy

	# validation of presence of fields
	validates_presence_of :name, :fees, :website, :course

	# validation of lengths
	validates_length_of :name, in: 6..40
	validates_length_of :website, in: 10..100
	validates_length_of :course, in: 10..100
	validates_length_of :facebook, in: 6..100, allow_nil: true
	validates_length_of :twitter, in: 6..100, allow_nil: true

	# validation of ranges
	validates_inclusion_of :employment_rate, in: 0..100, allow_nil: true
	validates_inclusion_of :graduation_rate, in: 0..100, allow_nil: true
	validates_inclusion_of :averge_salary, in: 0..1000000, allow_nil: true
	validates_inclusion_of :fees, in: 0..50000

	# validates uniequeness
	 validates :name, uniqueness: true

end
