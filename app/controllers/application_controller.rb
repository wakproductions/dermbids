class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_admin_user!
    unless user_signed_in? && current_user_is_admin?
      flash[:error] = "You must be logged in as an administrator to access this section"
      redirect_to new_user_session_path
    end
  end

  def current_user_is_admin?
    current_user.user_type==User::TYPES[:admin]
  end

  def render_400_error
    render status:400, text: "Bad request"
  end
end
