class Rating < ApplicationRecord

	#association
	belongs_to :camp

  #validation for presence of fields
	validates_presence_of :name, :email, :overall_review, :curriculum_review,
	                      :job_assistance_review, :instructor_review, :title,
												:description,:camp_id

  #validation of ranges
	validates_length_of :name, in: 6..26
	validates_length_of :email, in: 10..100
	validates_length_of :title, in: 10..100
	validates_length_of :description, in: 50..1500

	#validation of ranges
	validates_inclusion_of :overall_review, in: 1..5
	validates_inclusion_of :instructor_review, in: 1..5
	validates_inclusion_of :curriculum_review, in: 1..5
	validates_inclusion_of :job_assistance_review, in: 1..5

	#validating uniequeness combo
	validates_uniqueness_of :email, scope: :camp_id

end
