# frozen_string_literal: true

module Types
  class TaskType < Types::BaseObject
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false, description: "The date and time the task was created"
    field :id, ID, null: false, description: "The ID of the task"
    field :name, String, null: false, description: "The name of the task"
    field :project, Types::ProjectType, null: false, description: "The project of the task"
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false, description: "The date and time the task was updated"
  end
end
