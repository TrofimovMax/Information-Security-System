reviewService = container "Review Service" {
    technology "Ruby on Rails"
    description "Управляет отзывами, оценками объектов размещения и комментариями пользователей."
}

reviewDatabase = container "Review DB" {
    technology "PostgreSQL"
    description "Хранит отзывы, оценки и комментарии пользователей."
    tags "Database"
}
