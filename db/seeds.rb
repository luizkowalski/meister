Project.create!(name: "Project 1")
Project.create!(name: "Project 2")
Project.create!(name: "Project 3")

Task.create!(name: "Task 1", project_id: Project.first.id)
Task.create!(name: "Task 2", project_id: Project.first.id)
Task.create!(name: "Task 3", project_id: Project.first.id)

Task.create!(name: "Task 4", project_id: Project.second.id)
Task.create!(name: "Task 5", project_id: Project.second.id)
Task.create!(name: "Task 6", project_id: Project.second.id)

Task.create!(name: "Task 7", project_id: Project.third.id)
Task.create!(name: "Task 8", project_id: Project.third.id)
Task.create!(name: "Task 9", project_id: Project.third.id)
