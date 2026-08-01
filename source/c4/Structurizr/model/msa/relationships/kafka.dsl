/************************************************
 * ANALYTIC SERVICE
 ************************************************/
fourStayMicroservices.kafka -> fourStayMicroservices.analyticsService "Sub: доменные события для аналитики" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * AUDIT SERVICE
 ************************************************/
fourStayMicroservices.kafka -> fourStayMicroservices.auditService "Sub: доменные события для аудита" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * BILLING SERVICE
 ************************************************/
fourStayMicroservices.kafka -> fourStayMicroservices.billingService "Sub: события бронирований и статусов платежей" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * BOOKING SERVICE
 ************************************************/
fourStayMicroservices.bookingService -> fourStayMicroservices.kafka "Pub: события бронирований" "Kafka Protocol" {
    tags "Event"
}
fourStayMicroservices.kafka -> fourStayMicroservices.bookingService "Sub: read model объектов/профилей" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * BOOKING ORCHESTRATOR (SAGA)
 * Критический путь — синхронные вызовы (см. services.dsl).
 * Через Kafka — только пост-логика после успешного бронирования.
 ************************************************/
fourStayMicroservices.bookingOrchestrator -> fourStayMicroservices.kafka "Pub: событие успешного бронирования для пост-логики" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * CALENDAR SERVICE
 ************************************************/
fourStayMicroservices.calendarService -> fourStayMicroservices.kafka "Pub: события календарей" "Kafka Protocol" {
    tags "Event"
}
fourStayMicroservices.kafka -> fourStayMicroservices.calendarService "Sub: read model объектов" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * CONTENT SERVICE
 ************************************************/
fourStayMicroservices.contentService -> fourStayMicroservices.kafka "Pub: события контента" "Kafka Protocol" {
    tags "Event"
}
fourStayMicroservices.kafka -> fourStayMicroservices.contentService "Sub: read model объектов/справочников" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * CONVERSATION SERVICE
 ************************************************/
fourStayMicroservices.conversationService -> fourStayMicroservices.kafka "Pub: события сообщений" "Kafka Protocol" {
    tags "Event"
}
fourStayMicroservices.kafka -> fourStayMicroservices.conversationService "Sub: read model профилей" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * DASHBOARD SERVICE
 ************************************************/
fourStayMicroservices.kafka -> fourStayMicroservices.dashboardService "Sub: события для обновления показателей" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * DICTIONARY SERVICE
 ************************************************/
fourStayMicroservices.dictionaryService -> fourStayMicroservices.kafka "Pub: события справочников" "Kafka Protocol" {
    tags "Event"
}
fourStayMicroservices.kafka -> fourStayMicroservices.dictionaryService "Sub: синхронизация кэша" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * DOCUMENT SERVICE
 ************************************************/
fourStayMicroservices.documentService -> fourStayMicroservices.kafka "Pub: события договоров" "Kafka Protocol" {
    tags "Event"
}
fourStayMicroservices.kafka -> fourStayMicroservices.documentService "Sub: актуализация договоров" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * FEE SERVICE
 ************************************************/
fourStayMicroservices.kafka -> fourStayMicroservices.feeService "Sub: события обновления тарифов и правил комиссий" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * IDENTITY SERVICE
 ************************************************/
fourStayMicroservices.identityService -> fourStayMicroservices.kafka "Pub: события пользователей" "Kafka Protocol" {
    tags "Event"
}
fourStayMicroservices.kafka -> fourStayMicroservices.identityService "Sub: события импорта и деактивации" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * IMPORT SERVICE
 ************************************************/
fourStayMicroservices.importService -> fourStayMicroservices.kafka "Pub: события импорта" "Kafka Protocol" {
    tags "Event"
}
fourStayMicroservices.kafka -> fourStayMicroservices.importService "Sub: read model справочников/организаций" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * INVENTORY SERVICE
 ************************************************/
fourStayMicroservices.inventoryService -> fourStayMicroservices.kafka "Pub: события доступности" "Kafka Protocol" {
    tags "Event"
}
fourStayMicroservices.kafka -> fourStayMicroservices.inventoryService "Sub: read model справочников/объектов" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * LANDING SERVICE
 ************************************************/
fourStayMicroservices.kafka -> fourStayMicroservices.landingService "Sub: события обновления контента, объектов и доступности" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * NOTIFICATION SERVICE
 ************************************************/
fourStayMicroservices.notificationService -> fourStayMicroservices.kafka "Pub: события уведомлений" "Kafka Protocol" {
    tags "Event"
}
fourStayMicroservices.kafka -> fourStayMicroservices.notificationService "Sub: read model контактов" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * ORGANISATION SERVICE
 ************************************************/
fourStayMicroservices.organisationService -> fourStayMicroservices.kafka "Pub: события организаций" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * PERSONAL DATA SERVICE
 ************************************************/
fourStayMicroservices.personalDataService -> fourStayMicroservices.kafka "Pub: события ПДн" "Kafka Protocol" {
    tags "Event"
}
fourStayMicroservices.kafka -> fourStayMicroservices.personalDataService "Sub: синхронизация ПДн" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * PAYMENT AND PAYMENT GATEWAY SERVICES
 ************************************************/
fourStayMicroservices.paymentService -> fourStayMicroservices.kafka "Pub: события платежей" "Kafka Protocol" {
    tags "Event"
}
fourStayMicroservices.kafka -> fourStayMicroservices.paymentService "Sub: события invoice и результатов обработки" "Kafka Protocol" {
    tags "Event"
}
fourStayMicroservices.paymentGateway -> fourStayMicroservices.kafka "Pub: события обработки платежей" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * PAYMENT HISTORY SERVICE
 ************************************************/
fourStayMicroservices.kafka -> fourStayMicroservices.paymentHistoryService "Sub: события подтвержденных платежей для истории" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * POST-PAYMENT SERVICE
 ************************************************/
fourStayMicroservices.postPaymentService -> fourStayMicroservices.kafka "Pub: рассылка по топикам" "Kafka Protocol" {
    tags "Event"
}
fourStayMicroservices.kafka -> fourStayMicroservices.postPaymentService "Sub: события подтверждения платежей" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * RECONCILIATION SERVICE
 ************************************************/
fourStayMicroservices.reconciliationService -> fourStayMicroservices.kafka "Pub: события сверки" "Kafka Protocol" {
    tags "Event"
}
fourStayMicroservices.kafka -> fourStayMicroservices.reconciliationService "Sub: события платежей для реестров" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * PROMOTION SERVICE
 ************************************************/
fourStayMicroservices.promotionService -> fourStayMicroservices.kafka "Pub: события изменения акций" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * PROPERTY SERVICE
 ************************************************/
fourStayMicroservices.propertyService -> fourStayMicroservices.kafka "Pub: события объектов" "Kafka Protocol" {
    tags "Event"
}
fourStayMicroservices.kafka -> fourStayMicroservices.propertyService "Sub: read model справочников/контента" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * REVIEW SERVICE
 ************************************************/
fourStayMicroservices.reviewService -> fourStayMicroservices.kafka "Pub: события отзывов" "Kafka Protocol" {
    tags "Event"
}
fourStayMicroservices.kafka -> fourStayMicroservices.reviewService "Sub: read model объектов/профилей" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * SEARCH SERVICE
 ************************************************/
fourStayMicroservices.kafka -> fourStayMicroservices.searchService "Sub: события изменения объектов, доступности и справочников" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * TASK SERVICE
 ************************************************/
fourStayMicroservices.taskService -> fourStayMicroservices.kafka "Pub: события задач, подтверждения платежа и одобрения бронирования" "Kafka Protocol" {
    tags "Event"
}
fourStayMicroservices.kafka -> fourStayMicroservices.taskService "Sub: read model и события подтверждений" "Kafka Protocol" {
    tags "Event"
}

/************************************************
 * USER PROFILE SERVICE
 ************************************************/
fourStayMicroservices.userProfileService -> fourStayMicroservices.kafka "Pub: события профилей" "Kafka Protocol" {
    tags "Event"
}
fourStayMicroservices.kafka -> fourStayMicroservices.userProfileService "Sub: события импорта и деактивации" "Kafka Protocol" {
    tags "Event"
}
