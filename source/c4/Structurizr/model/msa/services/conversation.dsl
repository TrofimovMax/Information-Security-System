conversationService = container "Conversation Service" {
    technology "Ruby on Rails"
    description "Управляет чатами и сообщениями между пользователями платформы: гостями, хостами, менеджерами и сотрудниками поддержки."
}

conversationDatabase = container "Conversation DB" {
    technology "PostgreSQL"
    description "Хранит диалоги, сообщения, участников чатов, статусы сообщений и историю коммуникаций."
    tags "Database"
}
