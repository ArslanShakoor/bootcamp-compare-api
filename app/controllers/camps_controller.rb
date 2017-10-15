class CampsController < ApplicationController
	before_action  :set_camp, only: [:show]
	before_action :up_del_camp, only: [:update, :destroy]
	before_action :authenticate_user!, except: [:index, :show, :featured]
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

	def featured
		@camps_featured =  ActiveRecord::Base.connection.exec_query(
    	"SELECT camps.id,camps.name,camps.website,avg(overall_review)
    	 FROM ratings
    	 INNER JOIN camps
    	 ON ratings.camp_id = camps.id
    	 GROUP BY camps.id
    	")
    json_response(@camps_featured)

	end

	def create
    @camp = current_user.camps.create!(camp_params)
    json_response(@camp, :created)
	end

	def show
		json_response(@camp)
	end

	def update
    @up_del_camp.update(camp_params)
    head :no_content
	end

	def destroy
		@up_del_camp.destroy
    head :no_content
	end

	private
	  # return the parameters
	  def camp_params
      params.permit(:name, :fees, :course, :website)
	  end

    # retrun the camp and rating of camp
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
    # return the camp specific camp
	  def up_del_camp
	    @up_del_camp = Camp.find(params[:id])
	  end

end
