require "test_helper"

class DisplayModeTest < ActionDispatch::IntegrationTest
  test "display mode is set to grid by default" do
    get projects_path
    assert_equal "grid", cookies[:display_mode]
  end

  test "display mode is set to list" do
    get projects_path(display_mode: "list")

    assert_equal "list", cookies[:display_mode]
  end

  test "display mode is set to grid if invalid" do
    get projects_path(display_mode: "invalid")
    assert_equal "grid", cookies[:display_mode]
  end
end
