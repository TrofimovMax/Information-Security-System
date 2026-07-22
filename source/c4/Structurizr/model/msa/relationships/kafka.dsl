/************************************************
 * ANALYTIC SERVICE
 ************************************************/

fourStayMicroservices.kafka -> fourStayMicroservices.analyticsService "Получает доменные события для построения аналитики" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * AUDIT SERVICE
 ************************************************/
fourStayMicroservices.kafka -> fourStayMicroservices.auditService "Получает доменные события для аудита" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * BILLING SERVICE
 ************************************************/
fourStayMicroservices.kafka -> fourStayMicroservices.billingService "Получает события создания и изменения бронирований" "Kafka Protocol" {
    tags "Event"
}
fourStayMicroservices.kafka -> fourStayMicroservices.billingService "Получает события изменения статуса платежей" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * BOOKING SERVICE
 ************************************************/
fourStayMicroservices.bookingService -> fourStayMicroservices.kafka "Публикует события изменения бронирований" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * CALENDAR SERVICE
 ************************************************/
fourStayMicroservices.kafka -> fourStayMicroservices.calendarService "Получает события бронирований и изменений доступности" "Kafka Protocol" {
    tags "Event"
}
fourStayMicroservices.calendarService -> fourStayMicroservices.kafka "Публикует события изменения календарей" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * CONTENT SERVICE
 ************************************************/
fourStayMicroservices.kafka -> fourStayMicroservices.contentService "Получает события изменения объектов и организаций" "Kafka Protocol" {
    tags "Event"
}
fourStayMicroservices.contentService -> fourStayMicroservices.kafka "Публикует события изменения контента" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * CONVERSATION SERVICE
 ************************************************/
fourStayMicroservices.kafka -> fourStayMicroservices.conversationService "Получает события бронирований для создания диалогов" "Kafka Protocol" {
    tags "Event"
}
fourStayMicroservices.conversationService -> fourStayMicroservices.kafka "Публикует события сообщений" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * DASHBOARD SERVICE
 ************************************************/
fourStayMicroservices.kafka -> fourStayMicroservices.dashboardService "Получает события для обновления показателей" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * DICTIONARY SERVICE
 ************************************************/
fourStayMicroservices.dictionaryService -> fourStayMicroservices.kafka "Публикует события изменения справочных данных" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * FEE SERVICE
 ************************************************/
fourStayMicroservices.kafka -> fourStayMicroservices.feeService "Получает события для обновления тарифов и правил расчета комиссий" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * IDENTITY SERVICE
 ************************************************/
fourStayMicroservices.identityService -> fourStayMicroservices.kafka "Публикует события пользователей" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * IMPORT SERVICE
 ************************************************/
fourStayMicroservices.importService -> fourStayMicroservices.kafka "Публикует события завершения импорта" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * INVENTORY SERVICE
 ************************************************/
fourStayMicroservices.inventoryService -> fourStayMicroservices.kafka "Публикует события изменения доступности" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * LANDING SERVICE
 ************************************************/
fourStayMicroservices.kafka -> fourStayMicroservices.landingService "Передаёт события обновления контента, объектов и доступности" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * NOTIFICATION SERVICE
 ************************************************/
fourStayMicroservices.kafka -> fourStayMicroservices.notificationService "Получает события для отправки уведомлений" "Kafka Protocol" {
    tags "Event"
}
fourStayMicroservices.notificationService -> fourStayMicroservices.kafka "Публикует события отправки уведомлений" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * ORGANISATION SERVICE
 ************************************************/
fourStayMicroservices.organisationService -> fourStayMicroservices.kafka "Публикует события организаций" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * PAYMENT AND PAYMENT GATEWAY SERVICES
 ************************************************/
fourStayMicroservices.paymentService -> fourStayMicroservices.kafka "Публикует события платежей" "Kafka Protocol" {
    tags "Event"
}
fourStayMicroservices.kafka -> fourStayMicroservices.paymentService "Получает результаты обработки платежей" "Kafka Protocol" {
    tags "Event"
}
fourStayMicroservices.paymentGateway -> fourStayMicroservices.kafka "Публикует события обработки платежей" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * PROMOTION SERVICE
 ************************************************/
fourStayMicroservices.promotionService -> fourStayMicroservices.kafka "Публикует события изменения акций" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * PROPERTY SERVICE
 ************************************************/
fourStayMicroservices.propertyService -> fourStayMicroservices.kafka "Публикует события объектов размещения" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * REVIEW SERVICE
 ************************************************/
fourStayMicroservices.reviewService -> fourStayMicroservices.kafka "Публикует события отзывов" "Kafka Protocol" {
    tags "Event"
}
fourStayMicroservices.kafka -> fourStayMicroservices.reviewService "Получает события завершения проживания" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * SEARCH SERVICE
 ************************************************/
fourStayMicroservices.kafka -> fourStayMicroservices.searchService "Передаёт события изменения объектов, доступности и справочников" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * TASK SERVICE
 ************************************************/
fourStayMicroservices.taskService -> fourStayMicroservices.kafka "Публикует события задач" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * USER PROFILE SERVICE
 ************************************************/
fourStayMicroservices.userProfileService -> fourStayMicroservices.kafka "Публикует события изменения профиля" "Kafka Protocol" {
    tags "Event"
}
