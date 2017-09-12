class Rating < ApplicationRecord
	belongs_to :user
	belongs_to :camp

	validates_presence_of :title, :description, :overall_review, :instructor_review, :curriculum_review, :job_assistance_review

end
