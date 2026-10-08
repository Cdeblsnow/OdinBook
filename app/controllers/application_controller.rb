class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  rescue_from ActiveRecord::NotNullViolation, with: :handle_null

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes
  before_action :authenticate_user!

  def handle_null
    redirect_back fallback_location: :root_path, alert: :"The request could not be completed because
    one or more fields were blank"
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :user_name ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :user_name ])
  end
end
