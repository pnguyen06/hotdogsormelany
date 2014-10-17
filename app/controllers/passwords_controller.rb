class PasswordsController < Devise::PasswordsController
  protected
	def after_resetting_password_path_for(resource)
    new_user_session_path
   end

  def after_sending_reset_password_instructions_path_for(resource_name)
    new_user_session_path
  end
end