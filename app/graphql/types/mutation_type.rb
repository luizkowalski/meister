# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_task, mutation: Mutations::CreateTask,
      description: "Creates a new task with default name inside a project"
  end
end
