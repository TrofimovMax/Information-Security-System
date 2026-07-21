landingService = container "Landing Service" {
    technology "Ruby on Rails"
    description "Агрегирует данные для публичных страниц платформы, формирует лендинги, кэширует результаты и предоставляет оптимизированные ответы для Guest API."
}

landingDatabase = container "Landing Cache DB" {
    technology "Redis"
    description "Хранит кэш агрегированных данных лендингов и популярных страниц."
    tags "Database"
}
