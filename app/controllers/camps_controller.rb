class CampsController < ApplicationController
	before_action  :set_camp, only: [:show, :update, :destroy]
	before_action :authenticate_user!
	def index
    @camps =  ActiveRecord::Base.connection.exec_query(
    	"SELECT camps.*, avg(overall_review)
    	 FROM ratings
    	 INNER JOIN camps
    	 ON ratings.camp_id = camps.id
    	 GROUP BY camps.id
    	")
    json_response(@camps)
  end

	def create
    @camp = current_user.camps.create(camp_params)
    json_response(@camp, :created)
	end

	def show
		json_response(@camp)
	end

	def update
    @camp.update!(camp_params)
    head :no_content
	end

	def destroy
		@camp.destroy
    head :no_content
	end

	private
	 def camp_params
     params.permit(:name, :fees, :course, :website)
	 end

   def set_camp
   @camp =  ActiveRecord::Base.connection.exec_query(
		 "select camps.*, avg(overall_review) as overall,
		  avg(curriculum_review) as curriculum,
			avg(job_assistance_review) as job_assistance,
			avg(instructor_review) as instructor
		  from ratings
			inner join camps
			on ratings.camp_id = camps.id
			where camps.id=#{params[:id]}
			group by camps.id")
   end

end
