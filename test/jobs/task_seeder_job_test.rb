require "test_helper"

class TaskSeederJobTest < ActiveJob::TestCase
  test "should create tasks for each project" do
    assert_changes "Task.count", from: 2, to: 4 do
      TaskSeederJob.perform_now
    end
  end
end
