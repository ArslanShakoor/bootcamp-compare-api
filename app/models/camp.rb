class Camp < ApplicationRecord
	#validation
	validates_presence_of :name, :fees, :website, :course
end
