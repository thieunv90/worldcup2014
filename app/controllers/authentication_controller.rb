class AuthenticationController < Devise::RegistrationsController
  # POST /resource/change_password
  def change_password
    redirect_to new_user_session_path if !current_user
    resource = build_resource({})
  end
end