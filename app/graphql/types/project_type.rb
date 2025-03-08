# frozen_string_literal: true

module Types
  class ProjectType < Types::BaseObject
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false, description: "The date and time the project was created"
    field :id, ID, null: false, description: "The ID of the project"
    field :name, String, null: false, description: "The name of the project"
    field :tasks, [ Types::TaskType ], null: false, description: "The tasks of the project"
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false, description: "The date and time the project was updated"
  end
end
