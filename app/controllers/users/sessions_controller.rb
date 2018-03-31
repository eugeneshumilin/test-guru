class Users::SessionsController < Devise::SessionsController
  def create
    super
    if current_user.admin? || current_user.full_name.size > 1
      set_flash_message(:notice, :signed_in_hello, fullname: current_user.full_name)
    else
      set_flash_message(:notice, :hello_email, email: current_user.email)
    end
  end
end
