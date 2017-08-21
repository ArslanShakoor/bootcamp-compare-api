class UsersController < ApplicationController
  def create
  	@user = User.new(user_param)

  	if @user.save
  		render :create, status: :created
  	else
  	  head(:unprocessable_entity)	
  	end  

  end
  

  private
    def user_param
      params.require(:user).permit(:email, :password, :first_name, :last_name)	
    end
end	