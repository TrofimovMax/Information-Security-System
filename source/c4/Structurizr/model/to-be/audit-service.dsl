auditService = container "Audit Service" {
    technology "Ruby on Rails"
    description "Регистрирует действия пользователей и изменения бизнес-данных."
}

auditDatabase = container "Audit DB" {
    technology "PostgreSQL"
    description "Хранит журнал аудита действий пользователей и системных событий."
    tags "Database"
}
