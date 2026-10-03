class ApplicationController < ActionController::Base
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
end
