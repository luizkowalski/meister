# frozen_string_literal: true

require "test_helper"
require_relative "../graphql_test_helper"

class CreateTaskMutationTest < ActiveSupport::TestCase
  include GraphQLTestHelper

  setup do
    @project = projects(:new_york)
    @mutation = graphql_mutation_string("create_task")
  end

  test "creates a task with a custom name" do
    assert_changes "Task.count", 1 do
      execute_graphql(
        query: @mutation,
        variables: { projectId: @project.id.to_s, name: "Custom Task Name" }
      )
    end
  end

  test "the created task has the correct structure" do
    result = execute_graphql(
      query: @mutation,
      variables: { projectId: @project.id.to_s }
    )

    data = parse_graphql_response(result)

    task = data["createTask"]["task"]

    assert_match(/GraphQL Task/, task["name"])
    assert_equal @project.id.to_s, task["project"]["id"]
  end

  test "returns errors when the project is not found" do
    result = execute_graphql(
      query: @mutation,
      variables: { projectId: "invalid_id" }
    )

    data = parse_graphql_response(result)

    assert_equal [ "Project not found" ], data["createTask"]["errors"]
  end
end
