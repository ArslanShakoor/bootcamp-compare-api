class RatingsController < ApplicationController

  def create
	  @ratings = Rating.create(rating_params)
	  json_response(@ratings, :created)
  end

	def show
    @rating = Rating.where(camp_id: params[:id])
	  json_response(@rating)
	end

  def user_camp
    @rating = Rating.where(email: current_user.email)
    json_response(@rating)
  end

  private
    def rating_params
      params.permit(:title, :description, :overall_review, :curriculum_review, :instructor_review, :job_assistance_review, :anonymous, :camp_id, :email, :name )
    end
end