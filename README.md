# Meister

## Requirements

- Ruby 3.4.2
- MySQL >= 8

## Setting it up

Install dependencies:
```bash
bundle install
```

Create the database:
```bash
rails db:create db:migrate
```

Seed the database:
```bash
rails db:seed
```

Run the server and worker:
```bash
bin/dev
```
and then go to `http://localhost:3000`

## Running the tests:

```bash
bin/rails test
```

## Creating a task

Go to the GraphiQL interface: `http://localhost:3000/graphiql` and run the following mutation:

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

## Considerations
* Even though I should disconsider the frontend part, I've created a simple one using full-stack Rails because I thought it was a fun project to work on.
* I've stick to Rails' defaults, specially the Solid stack so that it is easier to test, no extra dependencies like Redis are required to run, just MySQL.
* Using `broadcast_refresh_to` to update the page when a task is created has benefits and drawbacks: from a developer experience perspective, it's great because the UI is updated in real time and Turbo uses morphing to update just the necessary parts of the page but forcing a refresh every time a task is created might be a performance issue. But again, if the page refresh is a problem, then your app is too big and probably doing a lot of money at that point.
* **Update**: I've decided to go with `broadcast_prepend_to` to update the page when a task is created because it's more efficient than `broadcast_refresh_to`.
* The grid/list switch could probably be implemented using pure JS but I think doing it with Rails' is much easier (and also Just Works™).
* **Updated:** I gave it a try and am toggling the display mode using javascript. I don't particularly like it but I think it's good enough for this.
