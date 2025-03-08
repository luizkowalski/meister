class Task < ApplicationRecord
  belongs_to :project

  after_commit :broadcast_task

  private

  def broadcast_task
    broadcast_refresh_to project
  end
end
