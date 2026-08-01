/************************************************
 * СИНХРОННЫЕ ВЫЗОВЫ (JSON / HTTPS)
 * Оставлены только критически необходимые:
 * - расчёт комиссий для UX (до оплаты)
 * - каналы оплаты от провайдера
 * - запись/выдача ПДн (безопасность, Vault)
 ************************************************/

/************************************************
 * BOOKING ORCHESTRATOR (SAGA)
 * Синхронные вызовы на критическом пути (гость ждёт ответа):
 * - проверка доступности (inventory/calendar)
 * - получение данных объекта (property)
 * - создание invoice (billing)
 * - инициализация платежа (payment)
 * Пост-логика (нотификации, аналитика) — асинхронно через Kafka.
 ************************************************/
fourStayMicroservices.bookingOrchestrator -> fourStayMicroservices.inventoryService "Проверяет доступность объекта и резервирует размещение на выбранный период" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.bookingOrchestrator -> fourStayMicroservices.calendarService "Проверяет и резервирует даты в календаре" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.bookingOrchestrator -> fourStayMicroservices.propertyService "Получает данные объекта размещения, правила и параметры" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.bookingOrchestrator -> fourStayMicroservices.billingService "Создаёт invoice на основании стоимости проживания, сборов и налогов" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.bookingOrchestrator -> fourStayMicroservices.paymentService "Инициализирует платёжную операцию для оплаты invoice" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.bookingOrchestrator -> fourStayMicroservices.userProfileService "Получает данные гостя для оформления бронирования" "JSON / HTTPS" {
    tags "Data Flow"
}

/************************************************
 * FEE SERVICE (КАЛЬКУЛЯТОР КОМИССИЙ)
 ************************************************/
fourStayMicroservices.paymentService -> fourStayMicroservices.feeService "Рассчитывает комиссии (пользовательская, провайдерская, мерчантская) и итоговую сумму списания" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.feeService -> fourStayMicroservices.paymentService "Возвращает рассчитанные комиссии и итоговую сумму по каналу оплаты" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.feeService -> fourStayMicroservices.paymentGateway "Получает доступные способы оплаты и параметры платежного провайдера" "JSON / HTTPS" {
    tags "Data Flow"
}

/************************************************
 * PERSONAL DATA SERVICE (VAULT)
 * Запись/выдача ПДн — синхронная (безопасность, Vault)
 ************************************************/
fourStayMicroservices.identityService -> fourStayMicroservices.personalDataService "Отправляет ПДн на хранение" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.userProfileService -> fourStayMicroservices.personalDataService "Отправляет ПДн на хранение" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.organisationService -> fourStayMicroservices.personalDataService "Отправляет ПДн на хранение" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.personalDataService -> fourStayMicroservices.identityService "Выдаёт ПДн по запросу" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.personalDataService -> fourStayMicroservices.userProfileService "Выдаёт ПДн по запросу" "JSON / HTTPS" {
    tags "Data Flow"
}

/************************************************
 * TASK SERVICE (ПОДТВЕРЖДЕНИЕ ПЛАТЕЖА)
 * Сотрудник 4Stay подтверждает платёж → фиксация в реестр
 ************************************************/
fourStayMicroservices.taskService -> fourStayMicroservices.reconciliationService "Фиксирует подтверждённый платёж в реестр" "JSON / HTTPS" {
    tags "Data Flow"
}
