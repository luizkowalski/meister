class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  VALID_DISPLAY_MODES = %w[ grid list ]

  before_action :set_display_mode

  private

  def set_display_mode
    display_mode = params[:display_mode] || cookies[:display_mode] || "grid"

    cookies[:display_mode] = if VALID_DISPLAY_MODES.include?(display_mode)
      display_mode
    else
      "grid"
    end
  end
end
