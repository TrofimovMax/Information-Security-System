/************************************************
 * GUEST API
 ************************************************/

fourStayMicroservices.guestApi -> fourStayMicroservices.analyticsService "Получает персональную статистику пользователя" "JSON / HTTPS"
fourStayMicroservices.guestApi -> fourStayMicroservices.billingService "Получает информацию о стоимости и счетах" "JSON / HTTPS"
fourStayMicroservices.guestApi -> fourStayMicroservices.bookingService "Создает и управляет бронированиями" "JSON / HTTPS"
fourStayMicroservices.guestApi -> fourStayMicroservices.calendarService "Получает календарь доступности объекта размещения" "JSON / HTTPS"
fourStayMicroservices.guestApi -> fourStayMicroservices.conversationService "Отправляет и получает сообщения по бронированиям" "JSON / HTTPS"
fourStayMicroservices.guestApi -> fourStayMicroservices.contentService "Получает страницы и информационный контент" "JSON / HTTPS"
fourStayMicroservices.guestApi -> fourStayMicroservices.dictionaryService "Получает справочные данные для поиска жилья" "JSON / HTTPS"
fourStayMicroservices.guestApi -> fourStayMicroservices.identityService "Аутентифицирует пользователя и проверяет права доступа" "JSON / HTTPS"
fourStayMicroservices.guestApi -> fourStayMicroservices.paymentService "Инициирует оплату бронирования" "JSON / HTTPS"
fourStayMicroservices.guestApi -> fourStayMicroservices.reviewService "Создаёт и управляет отзывами" "JSON / HTTPS"
fourStayMicroservices.guestApi -> fourStayMicroservices.userProfileService "Просматривает и изменяет профиль пользователя" "JSON / HTTPS"

/************************************************
 * HOST API
 ************************************************/

fourStayMicroservices.hostApi -> fourStayMicroservices.analyticsService "Получает статистику объектов размещения" "JSON / HTTPS"
fourStayMicroservices.hostApi -> fourStayMicroservices.billingService "Получает финансовую информацию по объектам" "JSON / HTTPS"
fourStayMicroservices.hostApi -> fourStayMicroservices.bookingService "Просматривает и управляет бронированиями объектов" "JSON / HTTPS"
fourStayMicroservices.hostApi -> fourStayMicroservices.calendarService "Управляет доступностью и синхронизацией календарей" "JSON / HTTPS"
fourStayMicroservices.hostApi -> fourStayMicroservices.conversationService "Общается с гостями и управляет сообщениями" "JSON / HTTPS"
fourStayMicroservices.hostApi -> fourStayMicroservices.contentService "Управляет описаниями и медиафайлами объектов" "JSON / HTTPS"
fourStayMicroservices.hostApi -> fourStayMicroservices.dashboardService "Получает показатели объектов размещения и бронирований" "JSON / HTTPS"
fourStayMicroservices.hostApi -> fourStayMicroservices.dictionaryService "Получает справочные данные для создания объектов размещения" "JSON / HTTPS"
fourStayMicroservices.hostApi -> fourStayMicroservices.identityService "Аутентифицирует пользователя и проверяет права доступа" "JSON / HTTPS"
fourStayMicroservices.hostApi -> fourStayMicroservices.inventoryService "Управляет доступностью объектов размещения" "JSON / HTTPS"
fourStayMicroservices.hostApi -> fourStayMicroservices.paymentService "Получает информацию о выплатах" "JSON / HTTPS"
fourStayMicroservices.hostApi -> fourStayMicroservices.promotionService "Управляет акциями и специальными предложениями" "JSON / HTTPS"
fourStayMicroservices.hostApi -> fourStayMicroservices.propertyService "Управляет объектами размещения" "JSON / HTTPS"
fourStayMicroservices.hostApi -> fourStayMicroservices.reviewService "Просматривает и отвечает на отзывы" "JSON / HTTPS"
fourStayMicroservices.hostApi -> fourStayMicroservices.userProfileService "Управляет профилем владельца" "JSON / HTTPS"

/************************************************
 * OPERATIONS API
 ************************************************/

fourStayMicroservices.operationsApi -> fourStayMicroservices.analyticsService "Получает аналитические отчёты и метрики" "JSON / HTTPS"
fourStayMicroservices.operationsApi -> fourStayMicroservices.auditService "Получает историю действий пользователей и изменений данных" "JSON / HTTPS"
fourStayMicroservices.operationsApi -> fourStayMicroservices.billingService "Управляет счетами и начислениями" "JSON / HTTPS"
fourStayMicroservices.operationsApi -> fourStayMicroservices.bookingService "Обрабатывает операционные запросы по бронированиям" "JSON / HTTPS"
fourStayMicroservices.operationsApi -> fourStayMicroservices.calendarService "Контролирует календари объектов размещения" "JSON / HTTPS"
fourStayMicroservices.operationsApi -> fourStayMicroservices.conversationService "Просматривает и обрабатывает обращения пользователей" "JSON / HTTPS"
fourStayMicroservices.operationsApi -> fourStayMicroservices.contentService "Управляет информационным контентом организации" "JSON / HTTPS"
fourStayMicroservices.operationsApi -> fourStayMicroservices.dashboardService "Получает операционные показатели платформы и административные показатели системы" "JSON / HTTPS"
fourStayMicroservices.operationsApi -> fourStayMicroservices.dictionaryService "Управляет справочными данными организации" "JSON / HTTPS"
fourStayMicroservices.operationsApi -> fourStayMicroservices.identityService "Аутентифицирует пользователя и проверяет права доступа" "JSON / HTTPS"
fourStayMicroservices.operationsApi -> fourStayMicroservices.importService "Управляет заданиями импорта" "JSON / HTTPS"
fourStayMicroservices.operationsApi -> fourStayMicroservices.inventoryService "Управляет календарями и доступностью объектов" "JSON / HTTPS"
fourStayMicroservices.operationsApi -> fourStayMicroservices.notificationService "Управляет уведомлениями и шаблонами" "JSON / HTTPS"
fourStayMicroservices.operationsApi -> fourStayMicroservices.organisationService "Управляет организациями и их структурой" "JSON / HTTPS"
fourStayMicroservices.operationsApi -> fourStayMicroservices.paymentService "Управляет платежами и возвратами" "JSON / HTTPS"
fourStayMicroservices.operationsApi -> fourStayMicroservices.promotionService "Управляет промо-кампаниями" "JSON / HTTPS"
fourStayMicroservices.operationsApi -> fourStayMicroservices.propertyService "Управляет объектами размещения" "JSON / HTTPS"
fourStayMicroservices.operationsApi -> fourStayMicroservices.reviewService "Модерирует отзывы" "JSON / HTTPS"
fourStayMicroservices.operationsApi -> fourStayMicroservices.taskService "Создает и обрабатывает операционные задачи" "JSON / HTTPS"
fourStayMicroservices.operationsApi -> fourStayMicroservices.userProfileService "Получает данные пользователей" "JSON / HTTPS"
