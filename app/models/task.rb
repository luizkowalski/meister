class Task < ApplicationRecord
  belongs_to :project

  after_commit :broadcast_task

  private

  def broadcast_task
    broadcast_prepend_to project, target: "tasks--container", partial: "tasks/task", locals: { task: self }
  end
end
