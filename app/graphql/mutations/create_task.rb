# frozen_string_literal: true

module Mutations
  class CreateTask < Mutations::BaseMutation
    argument :project_id, ID, required: true, description: "The ID of the project"

    field :errors, [ String ], null: false, description: "List of errors (if any)"
    field :task, Types::TaskType, null: true, description: "The task"

    def resolve(project_id:)
      project = Project.find_by(id: project_id)

      if project.nil?
        return {
          task: nil,
          errors: [ "Project not found" ]
        }
      end

      task = project.tasks.build(
        name: "GraphQL Task #{Time.current.strftime('%d-%m-%Y %H:%M:%S')}"
      )

      if task.save
        {
          task: task,
          errors: []
        }
      else
        {
          task: nil,
          errors: task.errors.full_messages
        }
      end
    end
  end
end
