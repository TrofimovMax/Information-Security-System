conversationService = container "Conversation Service" {
    technology "Ruby on Rails"
    description "Управляет чатами, диалогами и обменом сообщениями между пользователями."
}

conversationDatabase = container "Conversation DB" {
    technology "PostgreSQL"
    description "Хранит диалоги, сообщения, участников чатов и историю переписки."
    tags "Database"
}
