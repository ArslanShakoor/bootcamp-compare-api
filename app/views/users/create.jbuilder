json.data do
	json.user do
		json.call(
		  @user,
		  :email,
		  :id,
		  :authentication_token,
		  :confirmed_at
    )
	end	
end