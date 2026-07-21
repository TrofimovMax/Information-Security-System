/************************************************
 * analytic
 ************************************************/

fourStayMicroservices.kafka -> fourStayMicroservices.analyticsService "Получает доменные события для построения аналитики" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * audit
 ************************************************/
fourStayMicroservices.kafka -> fourStayMicroservices.auditService "Получает доменные события для аудита" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * billing
 ************************************************/
fourStayMicroservices.kafka -> fourStayMicroservices.billingService "Получает события создания и изменения бронирований" "Kafka Protocol" {
    tags "Event"
}
fourStayMicroservices.kafka -> fourStayMicroservices.billingService "Получает события изменения статуса платежей" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * booking
 ************************************************/
fourStayMicroservices.bookingService -> fourStayMicroservices.kafka "Публикует события изменения бронирований" "Kafka event"

/************************************************
 * calendar
 ************************************************/
fourStayMicroservices.kafka -> fourStayMicroservices.calendarService "Получает события бронирований и изменений доступности" "Kafka Protocol" {
    tags "Event"
}
fourStayMicroservices.calendarService -> fourStayMicroservices.kafka "Публикует события изменения календарей" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * content
 ************************************************/
fourStayMicroservices.kafka -> fourStayMicroservices.contentService "Получает события изменения объектов и организаций" "Kafka Protocol" {
    tags "Event"
}
fourStayMicroservices.contentService -> fourStayMicroservices.kafka "Публикует события изменения контента" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * conversation
 ************************************************/

fourStayMicroservices.kafka -> fourStayMicroservices.conversationService "Получает события бронирований для создания диалогов" "Kafka Protocol" {
    tags "Event"
}
fourStayMicroservices.conversationService -> fourStayMicroservices.kafka "Публикует события сообщений" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * dashboard
 ************************************************/
fourStayMicroservices.kafka -> fourStayMicroservices.dashboardService "Получает события для обновления показателей" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * dictionary
 ************************************************/
fourStayMicroservices.dictionaryService -> fourStayMicroservices.kafka "Публикует события изменения справочных данных" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * identity
 ************************************************/
fourStayMicroservices.identityService -> fourStayMicroservices.kafka "Публикует события пользователей" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * import
 ************************************************/
fourStayMicroservices.importService -> fourStayMicroservices.kafka "Публикует события завершения импорта" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * inventory
 ************************************************/
fourStayMicroservices.inventoryService -> fourStayMicroservices.kafka "Публикует события изменения доступности" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * landing
 ************************************************/
fourStayMicroservices.kafka -> fourStayMicroservices.landingService "Передаёт события обновления контента, объектов и доступности" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * notification
 ************************************************/
fourStayMicroservices.kafka -> fourStayMicroservices.notificationService "Получает события для отправки уведомлений" "Kafka Protocol" {
    tags "Event"
}
fourStayMicroservices.notificationService -> fourStayMicroservices.kafka "Публикует события отправки уведомлений" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * organisation
 ************************************************/
fourStayMicroservices.organisationService -> fourStayMicroservices.kafka "Публикует события организаций" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * payment and payment gateway
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
 * promotion
 ************************************************/
fourStayMicroservices.promotionService -> fourStayMicroservices.kafka "Публикует события изменения акций" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * property
 ************************************************/
fourStayMicroservices.propertyService -> fourStayMicroservices.kafka "Публикует события объектов размещения" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * review
 ************************************************/
fourStayMicroservices.reviewService -> fourStayMicroservices.kafka "Публикует события отзывов" "Kafka Protocol" {
    tags "Event"
}
fourStayMicroservices.kafka -> fourStayMicroservices.reviewService "Получает события завершения проживания" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * search
 ************************************************/
fourStayMicroservices.kafka -> fourStayMicroservices.searchService "Передаёт события изменения объектов, доступности и справочников" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * task
 ************************************************/
fourStayMicroservices.taskService -> fourStayMicroservices.kafka "Публикует события задач" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * user profile
 ************************************************/
fourStayMicroservices.userProfileService -> fourStayMicroservices.kafka "Публикует события изменения профиля" "Kafka Protocol" {
    tags "Event"
}
