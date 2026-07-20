importService = container "Import Service" {
    technology "Ruby on Rails"
    description "Обрабатывает массовый импорт данных, управляет заданиями импорта, проверяет файлы и координирует загрузку данных в бизнес-сервисы."
}

importDatabase = container "Import DB" {
    technology "PostgreSQL"
    description "Хранит задания импорта, статусы выполнения, журналы обработки и результаты валидации."
    tags "Database"
}
