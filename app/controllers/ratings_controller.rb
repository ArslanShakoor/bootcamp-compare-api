class RatingsController < ApplicationController

	before_action :authenticate_user!

  def create
  @ratings = current_user.ratings.create(rating_params)
  json_response(@ratings, :created)
  end

  private
    def rating_params
      params.permit(:title, :description, :overall_review, :curriculum_review, :instructor_review, :job_assistance_review, :anonymous, :camp_id )
    end 
end