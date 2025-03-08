# frozen_string_literal: true

module GraphQLTestHelper
  def execute_graphql(query:, variables: {}, context: {})
    MeisterSchema.execute(
      query,
      variables: variables.deep_stringify_keys,
      context: context
    )
  end

  def parse_graphql_response(response)
    if response["errors"].present?
      raise "GraphQL Error: #{response["errors"].map { |e| e["message"] }.join(", ")}"
    end
    response["data"]
  end

  def graphql_query_string(filename)
    Rails.root.join("test/graphql/queries/#{filename}.graphql").read
  end

  def graphql_mutation_string(filename)
    Rails.root.join("test/graphql/mutations/#{filename}.graphql").read
  end
end
