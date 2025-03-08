module DisplayModeHelper
  def toggle_display_mode_path
    request.path + "?" + request.query_parameters.merge(display_mode: next_display_mode).to_param
  end

  def display_grid? = current_display_mode == "grid"

  def display_list? = !display_grid?

  def next_display_mode = display_grid? ? "list" : "grid"
end
