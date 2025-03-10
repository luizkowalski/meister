module DisplayModeHelper
  def display_grid?     = current_display_mode == "grid"
  def display_list?     = !display_grid?
end
