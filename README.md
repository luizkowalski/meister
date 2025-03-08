# Meister

### Creating a task
```graphql
mutation CreateTask {
  createTask(input: { projectId: "1" }) {
    task {
      id
      name
      project {
        id
        name
      }
      createdAt
    }
    errors
  }
}
```
