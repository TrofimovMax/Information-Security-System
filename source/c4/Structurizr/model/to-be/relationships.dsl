/************************************************
 * ПОЛЬЗОВАТЕЛИ
 ************************************************/

guest -> fourStayMicroservices.guestApi "Ищет, бронирует, оплачивает и продлевает проживание" "JSON / HTTPS"
host -> fourStayMicroservices.hostApi "Управляет объектами размещения, тарифами и доступностью" "JSON / HTTPS"
manager -> fourStayMicroservices.hostApi "Управляет календарями, бронированиями и заселением" "JSON / HTTPS"
organisation_admin -> fourStayMicroservices.operationsApi "Управляет организацией, пользователями и настройками" "JSON / HTTPS"
customer_service -> fourStayMicroservices.operationsApi "Обрабатывает обращения и решает проблемы гостей" "JSON / HTTPS"
agent -> fourStayMicroservices.operationsApi "Координирует обращения и эскалирует запросы" "JSON / HTTPS"
admin -> fourStayMicroservices.operationsApi "Администрирует платформу и управляет системой" "JSON / HTTPS"


/************************************************
 * Web Application обращается к API
 ************************************************/

fourStayMicroservices.webApplication -> fourStayMicroservices.guestApi "Выполняет REST-запросы" "JSON / HTTPS"
fourStayMicroservices.webApplication -> fourStayMicroservices.hostApi "Выполняет REST-запросы" "JSON / HTTPS"
fourStayMicroservices.webApplication -> fourStayMicroservices.operationsApi "Выполняет REST-запросы" "JSON / HTTPS"


/************************************************
 * Guest API
 ************************************************/

fourStayMicroservices.guestApi -> fourStayMicroservices.bookingService "Booking API" "JSON / HTTPS"
fourStayMicroservices.guestApi -> fourStayMicroservices.conversationService "Conversation API" "JSON / HTTPS"
fourStayMicroservices.guestApi -> fourStayMicroservices.identityService "Identity API" "JSON / HTTPS"
fourStayMicroservices.guestApi -> fourStayMicroservices.inventoryService "Inventory API" "JSON / HTTPS"
fourStayMicroservices.guestApi -> fourStayMicroservices.notificationService "Notification API" "JSON / HTTPS"
fourStayMicroservices.guestApi -> fourStayMicroservices.paymentService "Payment API" "JSON / HTTPS"
fourStayMicroservices.guestApi -> fourStayMicroservices.propertyService "Property API" "JSON / HTTPS"
fourStayMicroservices.guestApi -> fourStayMicroservices.reviewService "Review API" "JSON / HTTPS"
fourStayMicroservices.guestApi -> fourStayMicroservices.userProfileService "User Profile API" "JSON / HTTPS"

/************************************************
 * Host API
 ************************************************/

fourStayMicroservices.hostApi -> fourStayMicroservices.bookingService "Booking API" "JSON / HTTPS"
fourStayMicroservices.hostApi -> fourStayMicroservices.billingService "Billing API" "JSON / HTTPS"
fourStayMicroservices.hostApi -> fourStayMicroservices.conversationService "Conversation API" "JSON / HTTPS"
fourStayMicroservices.hostApi -> fourStayMicroservices.identityService "Identity API" "JSON / HTTPS"
fourStayMicroservices.hostApi -> fourStayMicroservices.inventoryService "Inventory API" "JSON / HTTPS"
fourStayMicroservices.hostApi -> fourStayMicroservices.notificationService "Notification API" "JSON / HTTPS"
fourStayMicroservices.hostApi -> fourStayMicroservices.organisationService "Organisation API" "JSON / HTTPS"
fourStayMicroservices.hostApi -> fourStayMicroservices.propertyService "Property API" "JSON / HTTPS"
fourStayMicroservices.hostApi -> fourStayMicroservices.userProfileService "User Profile API" "JSON / HTTPS"

/************************************************
 * Operations API
 ************************************************/

fourStayMicroservices.operationsApi -> fourStayMicroservices.analyticsService "Analytics API" "JSON / HTTPS"
fourStayMicroservices.operationsApi -> fourStayMicroservices.auditService "Audit API" "JSON / HTTPS"
fourStayMicroservices.operationsApi -> fourStayMicroservices.billingService "Billing API" "JSON / HTTPS"
fourStayMicroservices.operationsApi -> fourStayMicroservices.bookingService "Booking API" "JSON / HTTPS"
fourStayMicroservices.operationsApi -> fourStayMicroservices.conversationService "Conversation API" "JSON / HTTPS"
fourStayMicroservices.operationsApi -> fourStayMicroservices.identityService "Identity API" "JSON / HTTPS"
fourStayMicroservices.operationsApi -> fourStayMicroservices.notificationService "Notification API" "JSON / HTTPS"
fourStayMicroservices.operationsApi -> fourStayMicroservices.paymentService "Payment API" "JSON / HTTPS"
fourStayMicroservices.operationsApi -> fourStayMicroservices.propertyService "Property API" "JSON / HTTPS"
fourStayMicroservices.operationsApi -> fourStayMicroservices.reviewService "Review API" "JSON / HTTPS"
fourStayMicroservices.operationsApi -> fourStayMicroservices.taskService "Task API" "JSON / HTTPS"
fourStayMicroservices.operationsApi -> fourStayMicroservices.userProfileService "User Profile API" "JSON / HTTPS"

/************************************************
 * БАЗЫ ДАННЫХ
 ************************************************/

/************************************************
 * БАЗЫ ДАННЫХ
 ************************************************/

fourStayMicroservices.analyticsService -> fourStayMicroservices.analyticsDatabase "Читает и сохраняет аналитические данные" "SQL"
fourStayMicroservices.billingService -> fourStayMicroservices.billingDatabase "Читает и сохраняет данные счетов" "SQL"
fourStayMicroservices.bookingService -> fourStayMicroservices.bookingDatabase "Читает и сохраняет данные бронирований" "SQL"
fourStayMicroservices.contentService -> fourStayMicroservices.contentDatabase "Читает и сохраняет контент" "SQL"
fourStayMicroservices.conversationService -> fourStayMicroservices.conversationDatabase "Читает и сохраняет сообщения" "SQL"
fourStayMicroservices.dictionaryService -> fourStayMicroservices.dictionaryDatabase "Читает и сохраняет справочные данные" "SQL"
fourStayMicroservices.identityService -> fourStayMicroservices.identityDatabase "Читает и сохраняет пользователей и роли" "SQL"
fourStayMicroservices.importService -> fourStayMicroservices.importDatabase "Читает и сохраняет задания импорта" "SQL"
fourStayMicroservices.inventoryService -> fourStayMicroservices.inventoryDatabase "Читает и сохраняет данные доступности" "SQL"
fourStayMicroservices.notificationService -> fourStayMicroservices.notificationDatabase "Читает и сохраняет уведомления" "SQL"
fourStayMicroservices.organisationService -> fourStayMicroservices.organisationDatabase "Читает и сохраняет данные организаций" "SQL"
fourStayMicroservices.paymentService -> fourStayMicroservices.paymentDatabase "Читает и сохраняет данные платежей" "SQL"
fourStayMicroservices.propertyService -> fourStayMicroservices.propertyDatabase "Читает и сохраняет данные объектов размещения" "SQL"
fourStayMicroservices.reviewService -> fourStayMicroservices.reviewDatabase "Читает и сохраняет отзывы" "SQL"
fourStayMicroservices.taskService -> fourStayMicroservices.taskDatabase "Читает и сохраняет задачи" "SQL"
fourStayMicroservices.userProfileService -> fourStayMicroservices.userProfileDatabase "Читает и сохраняет профили пользователей" "SQL"


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
fourStayMicroservices.kafka -> fourStayMicroservices.auditService "Получает доменные события" "Kafka Protocol"
fourStayMicroservices.kafka -> fourStayMicroservices.billingService "Получает события бронирований и платежей" "Kafka Protocol"
fourStayMicroservices.kafka -> fourStayMicroservices.bookingService "Получает события пользователей, объектов и доступности" "Kafka Protocol"
fourStayMicroservices.kafka -> fourStayMicroservices.conversationService "Получает события бронирований" "Kafka Protocol"
fourStayMicroservices.kafka -> fourStayMicroservices.notificationService "Получает события пользователей" "Kafka Protocol"
fourStayMicroservices.kafka -> fourStayMicroservices.reviewService "Получает события завершения бронирований" "Kafka Protocol"
fourStayMicroservices.kafka -> fourStayMicroservices.taskService "Получает события бронирований и платежей" "Kafka Protocol"


/************************************************
 * ВНЕШНИЕ СИСТЕМЫ
 ************************************************/

fourStayMicroservices.webApplication -> mapbox "Отображение карт и геоданных" "HTTPS / Mapbox API"
fourStayMicroservices.identityService -> knock "Аутентификация пользователей и отправка OTP" "JSON / HTTPS"
fourStayMicroservices.notificationService -> knock "Отправка уведомлений" "JSON / HTTPS"


/************************************************
 * ПЛАТЕЖНЫЙ ШЛЮЗ
 ************************************************/

fourStayMicroservices.paymentService -> fourStayMicroservices.paymentGateway "Инициирует обработку платежей" "JSON / HTTPS"
fourStayMicroservices.paymentGateway -> stripe "Обработка платежей" "JSON / HTTPS"
fourStayMicroservices.paymentGateway -> fourStayMicroservices.paymentGatewayDatabase "Чтение/запись журналов платежей" "SQL"
