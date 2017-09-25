def bypass_authentication
  credential = {email: "admin@admin.com", password: "fanihoja"}
  current_user = SessionsController.create(params: credential)

  ApplicationController.send(:alias_method, :current_user,:current_user)
  ApplicationController.send(:define_method, :current_user) do
    current_user
  end
  current_user
end

def restore_authentication
  ApplicationController.send(:alias_method, :current_user, :old_current_user)
end
