organisationService = container "Organisation Service" {
    technology "Ruby on Rails"
    description "Управляет организациями, офисами, участниками организаций, партнёрами, университетами и настройками доступа к объектам размещения."
}

organisationDatabase = container "Organisation DB" {
    technology "PostgreSQL"
    description "Хранит организации, офисы, участников организаций, связи пользователей с организациями и настройки организаций."
    tags "Database"
}
