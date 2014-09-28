class RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      # BackgroundWorker.trigger(resource)
      
      if resource.team == "melany"
        username = "Melany's " + Bazaar.object.titlecase
        while(User.exists?(:username => username))
          username = "Melany's " + Bazaar.object.titlecase
        end
        resource.username = username
      else
        username = "Hot Dog of the " + Bazaar.super_object.titlecase
        while(User.exists?(:username => username))
          username = "Hot Dog of the " + Bazaar.super_object.titlecase
        end
        resource.username = username
      end
     end
  end


  def update
    @user = User.find(current_user.id)

    successfully_updated = if needs_password?(@user, params)
      @user.update_with_password(devise_parameter_sanitizer.sanitize(:account_update))
    else
      # remove the virtual current_password attribute
      # update_without_password doesn't know how to ignore it
      params[:user].delete(:current_password)
      @user.update_without_password(devise_parameter_sanitizer.sanitize(:account_update))
    end

    if successfully_updated
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case their password changed
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render "edit"
    end
  end

  private

  # check if we need password to update user data
  # ie if password or email was changed
  # extend this as needed
  def needs_password?(user, params)
    user.email != params[:user][:email] ||
      params[:user][:password].present? ||
      params[:user][:password_confirmation].present?
  end

  def user_params
    params.require(:user).permit(:avatar)
  end
end