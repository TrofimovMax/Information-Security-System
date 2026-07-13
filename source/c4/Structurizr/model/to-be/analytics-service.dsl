analyticsService = container "Analytics Service" {
    technology "Ruby on Rails"
    description "Обеспечивает работу аналитики, дашбордов и отслеживание активности пользователей."
}

analyticsDatabase = container "Analytics DB" {
    technology "PostgreSQL"
    description "Хранит аналитические данные, дашборды, отчёты, метрики и агрегированные события."
    tags "Database"
}
