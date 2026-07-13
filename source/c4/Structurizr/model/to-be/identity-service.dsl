identityService = container "Identity Service" {
    technology "Ruby on Rails"
    description "Обеспечивает аутентификацию, авторизацию, управление пользователями и одноразовыми паролями."
}

identityDatabase = container "Identity DB" {
    technology "PostgreSQL"
    description "Хранит пользователей, роли, сессии и одноразовые пароли."
    tags "Database"
}
