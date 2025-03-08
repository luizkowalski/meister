# frozen_string_literal: true

require "test_helper"
require_relative "../graphql_test_helper"

class ProjectsQueryTest < ActiveSupport::TestCase
  include GraphQLTestHelper

  setup do
    @expected_response = {
      "projects" => Project.all.map do |project|
        {
          "id" => project.id.to_s,
          "name" => project.name,
          "tasks" => project.tasks.map do |task|
            {
              "id" => task.id.to_s,
              "name" => task.name
            }
          end
        }
      end
    }
  end

  test "fetches projects with tasks" do
    query = graphql_query_string("projects")

    result = execute_graphql(query: query, variables: { limit: 10 })
    data = parse_graphql_response(result)

    assert_equal @expected_response, data
  end
end
