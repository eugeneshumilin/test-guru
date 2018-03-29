class Users::SessionsController < Devise::SessionsController
  def create
    super
    set_flash_message(:notice, :signed_in_hello, fullname: current_user.full_name) if current_user.admin?
  end
end
