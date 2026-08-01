documentService = container "Document Service" {
    technology "Ruby on Rails"
    description "Управляет жизненным циклом договоров: генерация, подписание, акцепт, версии. Файлы хранит в Compliance Object Storage (WORM)."
    tags "Microservice"
}

documentDatabase = container "Document DB" {
    technology "PostgreSQL"
    description "Метаданные документов: тип, стороны, статус, версия, срок, ссылка на файл."
    tags "Database"
}
