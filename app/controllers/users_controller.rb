class UsersController < ApplicationController
  def create
  	@user = User.create(user_param)
  end

  def confirm
    token = token_param.to_s

    user = User.find_by(confirmation_token: token)

    if user.present?
      user.mark_as_confirmed!
      render json: {status: 'User confirmed successfully'}, status: :ok
    else
      render json: {status: 'Invalid token'}, status: :not_found
    end
  end



  private
    def user_param
      params.permit(:email, :password, :first_name, :last_name)
    end

    def token_param
      params.permit(:confirmation_token)
    end
end
