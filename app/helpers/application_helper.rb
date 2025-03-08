module ApplicationHelper
  def display_grid?
    current_display_mode == "grid"
  end

  def display_list?
    !display_grid?
  end
end
