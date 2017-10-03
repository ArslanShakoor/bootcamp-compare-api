class SessionsController < ApplicationController

  def show
    if current_user ? head(:ok) : head(:unauthorized)
    end
  end
  def create
  	@user = User.where(email: params[:email]).first
  	if @user&.valid_password?(params[:password])
  		render :create, status: :created
  	else
  	  head(:unauthorized)
  	end
  end

  def destroy
    current_user&.authentication_token = nil
    if current_user&.save
      head(:ok)
    else
      head(:unauthorized)  
  end
end
