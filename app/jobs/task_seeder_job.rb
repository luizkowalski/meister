class TaskSeederJob < ApplicationJob
  include Turbo::Broadcastable
  queue_as :default

  def perform
    Project.find_each do |project|
      project.tasks.create!(name: "New Task #{Time.current.strftime('%d-%m-%Y %H:%M:%S')}")
      broadcast_refresh_to project
    end
  end
end
