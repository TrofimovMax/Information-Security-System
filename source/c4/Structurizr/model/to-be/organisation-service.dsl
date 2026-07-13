organisationService = container "Organisation Service" {
    technology "Ruby on Rails"
    description "Управляет организациями, офисами, партнёрами и университетами."
}

organisationDatabase = container "Organisation DB" {
    technology "PostgreSQL"
    description "Хранит организации, офисы, партнёров и университеты."
    tags "Database"
}
