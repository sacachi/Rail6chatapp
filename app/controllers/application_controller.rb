class ApplicationController < ActionController::Base
  layout :layout_by_resource
  before_action :authenticate_user!

  def ensure_signup_complete
    # Ensure we don't go into an infinite loop
    return if action_name == 'finish_signup'

    # Redirect to the 'finish_signup' page if the user
    # email hasn't been verified yet
    if current_user && !current_user.email_verified?
      redirect_to finish_signup_path(current_user)
    end
  end

  private

  def layout_by_resource
    if current_user.blank?
      "login"
    else
      "application"
    end
  end

  def authentication_user!
    redirect_to new_user_session_path if current_user.blank?
  end


end
