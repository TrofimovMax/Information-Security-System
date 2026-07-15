notificationService = container "Notification Service" {
    technology "Ruby on Rails"
    description "Отправляет пользователям системные уведомления по электронной почте, SMS и push."
}

notificationDatabase = container "Notification DB" {
    technology "PostgreSQL"
    description "Хранит уведомления, шаблоны сообщений и статусы доставки."
    tags "Database"
}
