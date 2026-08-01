/************************************************
 * GUEST API
 ************************************************/

fourStayMicroservices.guestApi -> fourStayMicroservices.bookingService "Создает и управляет бронированиями" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.guestApi -> fourStayMicroservices.conversationService "Создаёт и получает сообщения с владельцем или поддержкой" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.guestApi -> fourStayMicroservices.identityService "Аутентифицирует пользователя и проверяет права доступа" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.guestApi -> fourStayMicroservices.landingService "Получает данные главной страницы и публичных лендингов" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.guestApi -> fourStayMicroservices.reviewService "Создает и управляет отзывами" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.guestApi -> fourStayMicroservices.searchService "Выполняет поиск жилья" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.guestApi -> fourStayMicroservices.userProfileService "Просматривает и изменяет профиль пользователя" "JSON / HTTPS" {
    tags "Data Flow"
}

/************************************************
 * HOST API
 ************************************************/

fourStayMicroservices.hostApi -> fourStayMicroservices.analyticsService "Получает статистику объектов размещения" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.hostApi -> fourStayMicroservices.billingService "Получает финансовую информацию по объектам" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.hostApi -> fourStayMicroservices.bookingService "Просматривает и управляет бронированиями объектов" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.hostApi -> fourStayMicroservices.calendarService "Управляет доступностью и синхронизацией календарей" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.hostApi -> fourStayMicroservices.conversationService "Общается с гостями и управляет сообщениями" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.hostApi -> fourStayMicroservices.contentService "Управляет описаниями и медиафайлами объектов" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.hostApi -> fourStayMicroservices.dashboardService "Получает показатели объектов размещения и бронирований" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.hostApi -> fourStayMicroservices.dictionaryService "Получает справочные данные для создания объектов размещения" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.hostApi -> fourStayMicroservices.identityService "Аутентифицирует пользователя и проверяет права доступа" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.hostApi -> fourStayMicroservices.inventoryService "Управляет доступностью объектов размещения" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.hostApi -> fourStayMicroservices.paymentService "Получает информацию о выплатах" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.hostApi -> fourStayMicroservices.promotionService "Управляет акциями и специальными предложениями" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.hostApi -> fourStayMicroservices.propertyService "Управляет объектами размещения" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.hostApi -> fourStayMicroservices.reviewService "Просматривает и отвечает на отзывы" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.hostApi -> fourStayMicroservices.userProfileService "Управляет профилем владельца" "JSON / HTTPS" {
    tags "Data Flow"
}

/************************************************
 * OPERATIONS API
 ************************************************/

fourStayMicroservices.operationsApi -> fourStayMicroservices.analyticsService "Получает аналитические отчёты и метрики" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.operationsApi -> fourStayMicroservices.auditService "Получает историю действий пользователей и изменений данных" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.operationsApi -> fourStayMicroservices.billingService "Управляет счетами и начислениями" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.operationsApi -> fourStayMicroservices.bookingService "Обрабатывает операционные запросы по бронированиям" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.operationsApi -> fourStayMicroservices.calendarService "Контролирует календари объектов размещения" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.operationsApi -> fourStayMicroservices.conversationService "Просматривает и обрабатывает обращения пользователей" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.operationsApi -> fourStayMicroservices.contentService "Управляет информационным контентом организации" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.operationsApi -> fourStayMicroservices.dashboardService "Получает операционные показатели платформы и административные показатели системы" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.operationsApi -> fourStayMicroservices.dictionaryService "Управляет справочными данными организации" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.operationsApi -> fourStayMicroservices.identityService "Аутентифицирует пользователя и проверяет права доступа" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.operationsApi -> fourStayMicroservices.importService "Управляет заданиями импорта" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.operationsApi -> fourStayMicroservices.inventoryService "Управляет календарями и доступностью объектов" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.operationsApi -> fourStayMicroservices.notificationService "Управляет уведомлениями и шаблонами" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.operationsApi -> fourStayMicroservices.organisationService "Управляет организациями и их структурой" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.operationsApi -> fourStayMicroservices.personalDataService "Управляет согласиями и запросами на экспорт/удаление ПДн" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.operationsApi -> fourStayMicroservices.paymentService "Управляет платежами и возвратами" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.operationsApi -> fourStayMicroservices.promotionService "Управляет промо-кампаниями" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.operationsApi -> fourStayMicroservices.propertyService "Управляет объектами размещения" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.operationsApi -> fourStayMicroservices.reviewService "Модерирует отзывы" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.operationsApi -> fourStayMicroservices.taskService "Создает и обрабатывает операционные задачи" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.operationsApi -> fourStayMicroservices.userProfileService "Получает данные пользователей" "JSON / HTTPS" {
    tags "Data Flow"
}
