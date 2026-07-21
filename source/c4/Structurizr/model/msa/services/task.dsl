taskService = container "Task Service" {
    technology "Ruby Rails"
    description "Управляет операционными задачами сотрудников поддержки, обращениями пользователей, назначением исполнителей, статусами обработки и внутренними рабочими процессами."
    tags "Microservice"
}

taskDatabase = container "Task DB" {
    technology "PostgreSQL"
    description "Хранит задачи, обращения пользователей, исполнителей, статусы, приоритеты, комментарии и историю изменений."
    tags "Database"
}
