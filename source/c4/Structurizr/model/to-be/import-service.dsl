importService = container "Import Service" {
    technology "Ruby on Rails"
    description "Импортирует документы, обрабатывает файлы и выполняет проверку импортируемых данных."
}

importDatabase = container "Import DB" {
    technology "PostgreSQL"
    description "Хранит задания на импорт, статусы обработки, результаты проверки и историю импортов."
    tags "Database"
}
