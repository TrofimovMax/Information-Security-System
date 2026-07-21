/************************************************
 * analytic
 ************************************************/

fourStayMicroservices.kafka -> fourStayMicroservices.analyticsService "Получает доменные события для построения аналитики" "Kafka Protocol"

/************************************************
 * audit
 ************************************************/
fourStayMicroservices.kafka -> fourStayMicroservices.auditService "Получает доменные события для аудита" "Kafka Protocol"

/************************************************
 * billing
 ************************************************/
fourStayMicroservices.kafka -> fourStayMicroservices.billingService "Получает события создания и изменения бронирований" "Kafka Protocol"
fourStayMicroservices.kafka -> fourStayMicroservices.billingService "Получает события изменения статуса платежей" "Kafka Protocol"

/************************************************
 * booking
 ************************************************/
fourStayMicroservices.bookingService -> fourStayMicroservices.kafka "Публикует события изменения бронирований" "Kafka event"

/************************************************
 * calendar
 ************************************************/
fourStayMicroservices.kafka -> fourStayMicroservices.calendarService "Получает события бронирований и изменений доступности" "Kafka Protocol"
fourStayMicroservices.calendarService -> fourStayMicroservices.kafka "Публикует события изменения календарей" "Kafka Protocol"

/************************************************
 * content
 ************************************************/
fourStayMicroservices.kafka -> fourStayMicroservices.contentService "Получает события изменения объектов и организаций" "Kafka Protocol"
fourStayMicroservices.contentService -> fourStayMicroservices.kafka "Публикует события изменения контента" "Kafka Protocol"

/************************************************
 * conversation
 ************************************************/

fourStayMicroservices.kafka -> fourStayMicroservices.conversationService "Получает события бронирований для создания диалогов" "Kafka Protocol"
fourStayMicroservices.conversationService -> fourStayMicroservices.kafka "Публикует события сообщений" "Kafka Protocol"

/************************************************
 * dashboard
 ************************************************/
fourStayMicroservices.kafka -> fourStayMicroservices.dashboardService "Получает события для обновления показателей" "Kafka Protocol"

/************************************************
 * dictionary
 ************************************************/
fourStayMicroservices.dictionaryService -> fourStayMicroservices.kafka "Публикует события изменения справочных данных" "Kafka Protocol"

/************************************************
 * identity
 ************************************************/
fourStayMicroservices.identityService -> fourStayMicroservices.kafka "Публикует события пользователей" "Kafka Protocol"

/************************************************
 * import
 ************************************************/
fourStayMicroservices.importService -> fourStayMicroservices.kafka "Публикует события завершения импорта" "Kafka Protocol"

/************************************************
 * inventory
 ************************************************/
fourStayMicroservices.inventoryService -> fourStayMicroservices.kafka "Публикует события изменения доступности" "Kafka Protocol"

/************************************************
 * landing
 ************************************************/
fourStayMicroservices.kafka -> fourStayMicroservices.landingService "Передаёт события обновления контента, объектов и доступности" "Kafka"

/************************************************
 * notification
 ************************************************/
fourStayMicroservices.kafka -> fourStayMicroservices.notificationService "Получает события для отправки уведомлений" "Kafka Protocol"
fourStayMicroservices.notificationService -> fourStayMicroservices.kafka "Публикует события отправки уведомлений" "Kafka Protocol"

/************************************************
 * organisation
 ************************************************/
fourStayMicroservices.organisationService -> fourStayMicroservices.kafka "Публикует события организаций" "Kafka Protocol"

/************************************************
 * payment and payment gateway
 ************************************************/
fourStayMicroservices.paymentService -> fourStayMicroservices.kafka "Публикует события платежей" "Kafka Protocol"
fourStayMicroservices.kafka -> fourStayMicroservices.paymentService "Получает результаты обработки платежей" "Kafka Protocol"
fourStayMicroservices.paymentGateway -> fourStayMicroservices.kafka "Публикует события обработки платежей" "Kafka Protocol"

/************************************************
 * promotion
 ************************************************/
fourStayMicroservices.promotionService -> fourStayMicroservices.kafka "Публикует события изменения акций" "Kafka Protocol"

/************************************************
 * property
 ************************************************/
fourStayMicroservices.propertyService -> fourStayMicroservices.kafka "Публикует события объектов размещения" "Kafka Protocol"

/************************************************
 * review
 ************************************************/
fourStayMicroservices.reviewService -> fourStayMicroservices.kafka "Публикует события отзывов" "Kafka Protocol"
fourStayMicroservices.kafka -> fourStayMicroservices.reviewService "Получает события завершения проживания" "Kafka Protocol"

/************************************************
 * search
 ************************************************/
fourStayMicroservices.kafka -> fourStayMicroservices.searchService "Передаёт события изменения объектов, доступности и справочников" "Kafka"

/************************************************
 * task
 ************************************************/
fourStayMicroservices.taskService -> fourStayMicroservices.kafka "Публикует события задач" "Kafka Protocol"

/************************************************
 * user profile
 ************************************************/
fourStayMicroservices.userProfileService -> fourStayMicroservices.kafka "Публикует события изменения профиля" "Kafka Protocol"
