notificationService = container "Notification Service" {
    technology "Ruby on Rails"
    description "Управляет уведомлениями, перепиской и коммуникацией с пользователями."
}

notificationDatabase = container "Notification DB" {
    technology "PostgreSQL"
    description "Хранит уведомления, сообщения и историю коммуникации."
    tags "Database"
}
