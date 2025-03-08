module Displayable
  extend ActiveSupport::Concern

  included do
    before_action :set_display_mode

    def current_display_mode
      params[:display_mode] || cookies[:display_mode] || DEFAULT_DISPLAY_MODE
    end
    helper_method :current_display_mode
  end

  VALID_DISPLAY_MODES = %w[ grid list ]
  DEFAULT_DISPLAY_MODE = "grid"

  private

  def set_display_mode
    cookies[:display_mode] = if VALID_DISPLAY_MODES.include?(current_display_mode)
      current_display_mode
    else
      DEFAULT_DISPLAY_MODE
    end
  end
end
