userProfileService = container "User Profile Service" {
    technology "Ruby on Rails"
    description "Управляет профилями пользователей, контактной информацией, предпочтениями и персональными данными."
}

userProfileDatabase = container "User Profile DB" {
    technology "PostgreSQL"
    description "Хранит профили пользователей, контактную информацию, настройки и предпочтения."
    tags "Database"
}
