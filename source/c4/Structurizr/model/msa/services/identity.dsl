identityService = container "Identity Service" {
    technology "Ruby on Rails"
    description "Обеспечивает аутентификацию и авторизацию пользователей, управление сессиями, токенами доступа, OTP-кодами и проверку прав доступа."
}

identityDatabase = container "Identity DB" {
    technology "PostgreSQL"
    description "Хранит учетные записи пользователей, учетные данные, роли, сессии, токены и одноразовые пароли."
    tags "Database"
}
