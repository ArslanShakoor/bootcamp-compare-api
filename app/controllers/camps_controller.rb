class CampsController < ApplicationController
	before_action  :set_camp, only: [:show, :update, :destroy]  
	 
	def index
    @camps = Camp.all
    json_response(@camps)
  end
	
	def create
    @camp = Camp.create!(camp_params)
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
   @camp = Camp.find(params[:id])
   end	
 
end
