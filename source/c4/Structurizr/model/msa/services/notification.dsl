notificationService = container "Notification Service" {
    technology "Ruby on Rails"
    description "Отправляет пользователям уведомления по электронной почте, SMS, Push и внутри приложения на основе доменных событий платформы."
    tags "Microservice"
}

notificationDatabase = container "Notification DB" {
    technology "PostgreSQL"
    description "Хранит шаблоны уведомлений, историю отправки, статусы доставки и пользовательские настройки уведомлений."
    tags "Database"
}
