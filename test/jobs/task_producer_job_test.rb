require "test_helper"

class TaskProducerJobTest < ActiveJob::TestCase
  test "should create tasks for each project" do
    assert_changes "Task.count", from: 2, to: 4 do
      TaskProducerJob.perform_now
    end
  end
end
