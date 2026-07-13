/************************************************
 * ПОЛЬЗОВАТЕЛИ
 ************************************************/

admin -> fourStayMicroservices.webApplication "Uses" "HTTPS"
agent -> fourStayMicroservices.webApplication "Uses" "HTTPS"
customer_service -> fourStayMicroservices.webApplication "Uses" "HTTPS"
guest -> fourStayMicroservices.webApplication "Uses" "HTTPS"
host -> fourStayMicroservices.webApplication "Uses" "HTTPS"
manager -> fourStayMicroservices.webApplication "Uses" "HTTPS"
organisation_admin -> fourStayMicroservices.webApplication "Uses" "HTTPS"


/************************************************
 * FRONTEND
 ************************************************/

fourStayMicroservices.webApplication -> fourStayMicroservices.apiGateway "GraphQL requests" "HTTPS"


/************************************************
 * API GATEWAY → МИКРОСЕРВИСЫ
 ************************************************/

fourStayMicroservices.apiGateway -> fourStayMicroservices.analyticsService "Analytics API" "JSON / HTTPS"
fourStayMicroservices.apiGateway -> fourStayMicroservices.billingService "Billing API" "JSON / HTTPS"
fourStayMicroservices.apiGateway -> fourStayMicroservices.bookingService "Booking API" "JSON / HTTPS"
fourStayMicroservices.apiGateway -> fourStayMicroservices.contentService "Content API" "JSON / HTTPS"
fourStayMicroservices.apiGateway -> fourStayMicroservices.dictionaryService "Dictionary API" "JSON / HTTPS"
fourStayMicroservices.apiGateway -> fourStayMicroservices.identityService "Identity API" "JSON / HTTPS"
fourStayMicroservices.apiGateway -> fourStayMicroservices.importService "Import API" "JSON / HTTPS"
fourStayMicroservices.apiGateway -> fourStayMicroservices.inventoryService "Inventory API" "JSON / HTTPS"
fourStayMicroservices.apiGateway -> fourStayMicroservices.notificationService "Notification API" "JSON / HTTPS"
fourStayMicroservices.apiGateway -> fourStayMicroservices.organisationService "Organisation API" "JSON / HTTPS"
fourStayMicroservices.apiGateway -> fourStayMicroservices.paymentService "Payment API" "JSON / HTTPS"
fourStayMicroservices.apiGateway -> fourStayMicroservices.propertyService "Property API" "JSON / HTTPS"
fourStayMicroservices.apiGateway -> fourStayMicroservices.taskService "Task API" "JSON / HTTPS"


/************************************************
 * БАЗЫ ДАННЫХ
 ************************************************/

fourStayMicroservices.analyticsService -> fourStayMicroservices.analyticsDatabase "Чтение/запись аналитики" "SQL"
fourStayMicroservices.billingService -> fourStayMicroservices.billingDatabase "Чтение/запись счетов" "SQL"
fourStayMicroservices.bookingService -> fourStayMicroservices.bookingDatabase "Чтение/запись бронирований" "SQL"
fourStayMicroservices.contentService -> fourStayMicroservices.contentDatabase "Чтение/запись контента" "SQL"
fourStayMicroservices.dictionaryService -> fourStayMicroservices.dictionaryDatabase "Чтение/запись справочных данных" "SQL"
fourStayMicroservices.identityService -> fourStayMicroservices.identityDatabase "Чтение/запись пользователей и ролей" "SQL"
fourStayMicroservices.importService -> fourStayMicroservices.importDatabase "Чтение/запись задач импорта" "SQL"
fourStayMicroservices.inventoryService -> fourStayMicroservices.inventoryDatabase "Чтение/запись доступности" "SQL"
fourStayMicroservices.notificationService -> fourStayMicroservices.notificationDatabase "Чтение/запись уведомлений" "SQL"
fourStayMicroservices.organisationService -> fourStayMicroservices.organisationDatabase "Чтение/запись организаций" "SQL"
fourStayMicroservices.paymentService -> fourStayMicroservices.paymentDatabase "Чтение/запись платежей" "SQL"
fourStayMicroservices.propertyService -> fourStayMicroservices.propertyDatabase "Чтение/запись объектов размещения" "SQL"
fourStayMicroservices.taskService -> fourStayMicroservices.taskDatabase "Чтение/запись задач" "SQL"


/************************************************
 * КЭШ
 ************************************************/

fourStayMicroservices.bookingService -> fourStayMicroservices.cache "Кэширование бронирований" "Redis"
fourStayMicroservices.identityService -> fourStayMicroservices.cache "Кэширование сессий" "Redis"
fourStayMicroservices.paymentService -> fourStayMicroservices.cache "Кэширование состояния платежей" "Redis"


/************************************************
 * ОБЪЕКТНОЕ ХРАНИЛИЩЕ
 ************************************************/

fourStayMicroservices.contentService -> fourStayMicroservices.objectStorage "Хранение медиафайлов" "S3 API"
fourStayMicroservices.importService -> fourStayMicroservices.importStorage "Хранение импортируемых файлов" "S3 API"


/************************************************
 * ШИНА СОБЫТИЙ (APACHE KAFKA)
 ************************************************/

/* Издатели событий */

fourStayMicroservices.bookingService -> fourStayMicroservices.kafka "Публикует события бронирований" "Kafka Protocol"
fourStayMicroservices.identityService -> fourStayMicroservices.kafka "Публикует события пользователей" "Kafka Protocol"
fourStayMicroservices.inventoryService -> fourStayMicroservices.kafka "Публикует события доступности" "Kafka Protocol"
fourStayMicroservices.organisationService -> fourStayMicroservices.kafka "Публикует события организаций" "Kafka Protocol"
fourStayMicroservices.paymentService -> fourStayMicroservices.kafka "Публикует события платежей" "Kafka Protocol"
fourStayMicroservices.propertyService -> fourStayMicroservices.kafka "Публикует события объектов размещения" "Kafka Protocol"

/* Подписчики на события */

fourStayMicroservices.kafka -> fourStayMicroservices.analyticsService "Получает доменные события" "Kafka Protocol"
fourStayMicroservices.kafka -> fourStayMicroservices.billingService "Получает события бронирований и платежей" "Kafka Protocol"
fourStayMicroservices.kafka -> fourStayMicroservices.bookingService "Получает события пользователей, объектов и доступности" "Kafka Protocol"
fourStayMicroservices.kafka -> fourStayMicroservices.notificationService "Получает события пользователей, бронирований и платежей" "Kafka Protocol"
fourStayMicroservices.kafka -> fourStayMicroservices.taskService "Получает события бронирований и платежей" "Kafka Protocol"


/************************************************
 * ВНЕШНИЕ СИСТЕМЫ
 ************************************************/

fourStayMicroservices.paymentService -> stripe "Обработка платежей" "JSON / HTTPS"
