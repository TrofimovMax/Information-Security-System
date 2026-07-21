stripe = softwareSystem "Stripe" {
    description "Внешний платежный сервис для обработки онлайн-платежей и возврата статусов транзакций."
    tags "External System" "Payment Provider"
}

knock = softwareSystem "Knock" {
    description "Внешний сервис аутентификации и доставки одноразовых паролей."
    tags "External API"
}

mapbox = softwareSystem "Mapbox" {
    description "Внешний картографический сервис для отображения карт, геокодирования и работы с геоданными."
    tags "External API"
}

ical = softwareSystem "Calendar (iCal)" {
    description "Внешние календарные сервисы, поддерживающие стандарт iCalendar (iCal), используемые для импорта и экспорта информации о доступности объектов размещения."
    tags "External API" "Calendar Provider"
}
