userProfileService = container "User Profile Service" {
    technology "Ruby on Rails"
    description "Управляет профилями пользователей, персональными данными, контактной информацией и пользовательскими настройками."
    tags "Microservice"
}

userProfileDatabase = container "User Profile DB" {
    technology "PostgreSQL"
    description "Хранит профили пользователей, контактные данные, аватары, настройки и пользовательские предпочтения."
    tags "Database"
}
