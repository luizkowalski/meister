module Displayable
  extend ActiveSupport::Concern

  included do
    def current_display_mode
      VALID_DISPLAY_MODES.include?(cookies[:display_mode]) ? cookies[:display_mode] : DEFAULT_DISPLAY_MODE
    end
    helper_method :current_display_mode
  end

  VALID_DISPLAY_MODES = %w[ grid list ]
  DEFAULT_DISPLAY_MODE = "grid"
end
