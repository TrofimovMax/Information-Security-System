reviewService = container "Review Service" {
    technology "Ruby on Rails"
    description "Управляет отзывами, рейтингами, комментариями и оценками объектов размещения после завершения проживания."
}

reviewDatabase = container "Review DB" {
    technology "PostgreSQL"
    description "Хранит отзывы, оценки, комментарии, ответы владельцев и статусы модерации."
    tags "Database"
}
