analyticsService = container "Analytics Service" {
    technology "Ruby on Rails"
    description "Собирает и предоставляет аналитические данные по бронированиям, платежам, активности пользователей и операционным показателям платформы."
}

analyticsDatabase = container "Analytics DB" {
    technology "PostgreSQL"
    description "Хранит агрегированные данные аналитики, отчёты, метрики и результаты обработки событий."
    tags "Database"
}
