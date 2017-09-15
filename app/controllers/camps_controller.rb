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
   @camp = ActiveRecord::Base.connection.exec_query(
		 "SELECT camps.*, avg(overall_review)
			FROM ratings
			INNER JOIN camps
			ON ratings.camp_id = camps.id
			WHERE camps.id = 20
			GROUP BY camps.id
		 ")
   end

end
