auditService = container "Audit Service" {
    technology "Ruby on Rails"
    description "Сервис аудита, который собирает и хранит информацию о действиях пользователей, изменениях бизнес-данных и системных событиях."
    tags "Microservice"
}

auditDatabase = container "Audit DB" {
    technology "PostgreSQL"
    description "Хранит историю действий пользователей, изменения сущностей, системные события и записи аудита."
    tags "Database"
}
