class Camp < ApplicationRecord
	belongs_to :user
	#validation
	validates_presence_of :name, :fees, :website, :course
end
