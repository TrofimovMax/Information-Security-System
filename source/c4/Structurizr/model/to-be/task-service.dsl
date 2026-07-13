taskService = container "Task Service" {
    technology "Ruby on Rails"
    description "Обрабатывает фоновые задачи, задания операторов и отложенные процессы."
}

taskDatabase = container "Task DB" {
    technology "PostgreSQL"
    description "Хранит задачи, назначения, статусы, историю активности и расписания выполнения."
    tags "Database"
}
