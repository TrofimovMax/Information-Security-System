paymentHistoryService = container "Payment History Service" {
    technology "Ruby on Rails"
    description "Хранит историю всех платежей с атрибутами и расчитанными комиссиями (пользовательская, провайдерская, мерчантская)."
    tags "Microservice"
}

paymentHistoryDatabase = container "Payment History DB" {
    technology "PostgreSQL"
    description "История платежей, комиссии, статусы, атрибуты транзакций."
    tags "Database"
}
