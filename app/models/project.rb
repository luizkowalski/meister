class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy

  scope :with_task_count, -> {
    select("projects.*, COUNT(tasks.id) as task_count")
    .left_joins(:tasks)
    .group(:id)
  }
end
