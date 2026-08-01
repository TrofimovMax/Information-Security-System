/************************************************
 * ANALYTIC SERVICE
 ************************************************/
fourStayMicroservices.analyticsService -> fourStayMicroservices.dashboardService "Передает агрегированные аналитические данные" "JSON / HTTPS" {
    tags "Data Flow"
}

/************************************************
 * AUDIT SERVICE
 ************************************************/
# ???

/************************************************
 * BILLING SERVICE
 ************************************************/
fourStayMicroservices.billingService -> fourStayMicroservices.dictionaryService "Получает информацию о валютах" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.billingService -> fourStayMicroservices.organisationService "Получает сведения об организациях для выставления счетов" "JSON / HTTPS" {
    tags "Data Flow"
}

/************************************************
 * BOOKING SERVICE
 ************************************************/

fourStayMicroservices.bookingService -> fourStayMicroservices.billingService "Рассчитывает стоимость проживания, сервисные сборы и налоги" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.bookingService -> fourStayMicroservices.inventoryService "Проверяет доступность объекта и резервирует размещение на выбранный период" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.bookingService -> fourStayMicroservices.paymentService "Создаёт платёжную операцию и инициирует оплату бронирования" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.bookingService -> fourStayMicroservices.propertyService "Получает информацию об объекте размещения, правилах проживания и параметрах объекта" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.bookingService -> fourStayMicroservices.userProfileService "Получает данные гостя и информацию, необходимую для оформления бронирования" "JSON / HTTPS" {
    tags "Data Flow"
}

/************************************************
 * CALENDAR SERVICE
 ************************************************/
fourStayMicroservices.calendarService -> fourStayMicroservices.inventoryService "Получает и обновляет данные доступности" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.calendarService -> fourStayMicroservices.propertyService "Получает данные объектов размещения и помещений" "JSON / HTTPS" {
    tags "Data Flow"
}

/************************************************
 * CONTENT SERVICE
 ************************************************/
fourStayMicroservices.contentService -> fourStayMicroservices.dictionaryService "Получает справочные данные для формирования страниц" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.contentService -> fourStayMicroservices.propertyService "Получает информацию об объектах размещения для отображения" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.contentService -> fourStayMicroservices.organisationService "Получает данные организаций для формирования страниц" "JSON / HTTPS" {
    tags "Data Flow"
}

/************************************************
 * CONVERSATION SERVICE
 ************************************************/
fourStayMicroservices.conversationService -> fourStayMicroservices.notificationService "Передает события отправки сообщений для уведомления пользователей" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.conversationService -> fourStayMicroservices.taskService "Создает задачи из обращений пользователей" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.conversationService -> fourStayMicroservices.userProfileService "Получает данные пользователей и участников диалогов" "JSON / HTTPS" {
    tags "Data Flow"
}

/************************************************
 * DASHBOARD SERVICE
 ************************************************/
# ???

/************************************************
 * DICTIONARY SERVICE
 ************************************************/
# ???

/************************************************
 * DOCUMENT SERVICE
 ************************************************/
fourStayMicroservices.documentService -> fourStayMicroservices.organisationService "Получает данные организаций для заполнения сторон договора" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.documentService -> fourStayMicroservices.personalDataService "Получает персональные данные сторон договора" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.documentService -> fourStayMicroservices.propertyService "Получает данные об объекте размещения для договора" "JSON / HTTPS" {
    tags "Data Flow"
}

/************************************************
 * FEE SERVICE
 ************************************************/
fourStayMicroservices.feeService -> fourStayMicroservices.dictionaryService "Получает валюты и финансовые справочники" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.feeService -> fourStayMicroservices.paymentGateway "Получает доступные способы оплаты и параметры платежного провайдера" "JSON / HTTPS" {
    tags "Data Flow"
}

/************************************************
 * IDENTITY SERVICE
 ************************************************/
fourStayMicroservices.identityService -> fourStayMicroservices.organisationService "Проверяет членство и права пользователя в организации" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.identityService -> fourStayMicroservices.userProfileService "Получает данные профиля пользователя" "JSON / HTTPS" {
    tags "Data Flow"
}

/************************************************
 * IMPORT SERVICE
 ************************************************/
fourStayMicroservices.importService -> fourStayMicroservices.dictionaryService "Получает справочные данные для проверки импортируемых записей" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.importService -> fourStayMicroservices.inventoryService "Импортирует данные доступности объектов" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.importService -> fourStayMicroservices.organisationService "Импортирует организации и участников" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.importService -> fourStayMicroservices.propertyService "Импортирует объекты размещения" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.importService -> fourStayMicroservices.userProfileService "Импортирует профили пользователей" "JSON / HTTPS" {
    tags "Data Flow"
}

/************************************************
 * INVENTORY SERVICE
 ************************************************/
fourStayMicroservices.inventoryService -> fourStayMicroservices.calendarService "Синхронизирует календари доступности" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.inventoryService -> fourStayMicroservices.dictionaryService "Получает справочные данные" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.inventoryService -> fourStayMicroservices.propertyService "Получает сведения об объектах размещения" "JSON / HTTPS" {
    tags "Data Flow"
}

/************************************************
 * LANDING SERVICE
 ************************************************/
fourStayMicroservices.landingService -> fourStayMicroservices.contentService "Получает CMS-контент" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.landingService -> fourStayMicroservices.dictionaryService "Получает города, университеты и районы" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.landingService -> fourStayMicroservices.propertyService "Получает популярные объекты размещения" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.landingService -> fourStayMicroservices.inventoryService "Получает информацию о доступности" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.landingService -> fourStayMicroservices.promotionService "Получает активные акции" "JSON / HTTPS" {
    tags "Data Flow"
}

/************************************************
 * NOTIFICATION SERVICE
 ************************************************/
fourStayMicroservices.notificationService -> fourStayMicroservices.userProfileService "Получает контактные данные и настройки уведомлений пользователя" "JSON / HTTPS" {
    tags "Data Flow"
}

/************************************************
 * ORGANISATION SERVICE
 ************************************************/
fourStayMicroservices.organisationService -> fourStayMicroservices.userProfileService "Получает сведения о пользователях организации" "JSON / HTTPS" {
    tags "Data Flow"
}

/************************************************
 * PERSONAL DATA SERVICE
 ************************************************/
fourStayMicroservices.identityService -> fourStayMicroservices.personalDataService "Отправляет персональные данные пользователей на хранение" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.userProfileService -> fourStayMicroservices.personalDataService "Отправляет персональные данные профилей на хранение" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.organisationService -> fourStayMicroservices.personalDataService "Отправляет персональные данные участников на хранение" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.personalDataService -> fourStayMicroservices.identityService "Предоставляет персональные данные по запросу" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.personalDataService -> fourStayMicroservices.userProfileService "Предоставляет персональные данные по запросу" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.personalDataService -> fourStayMicroservices.auditService "Журналирует операции с персональными данными" "JSON / HTTPS" {
    tags "Data Flow"
}

/************************************************
 * PAYMENT AND PAYMENT GATEWAY SERVICES
 ************************************************/
fourStayMicroservices.paymentService -> fourStayMicroservices.billingService "Обновляет статус оплаты счета" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.paymentService -> fourStayMicroservices.dictionaryService "Получает поддерживаемые валюты" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.paymentService -> fourStayMicroservices.feeService "Рассчитывает комиссии платежной системы и итоговую сумму списания" "JSON / HTTPS" {
    tags "Data Flow"
}

/************************************************
 * PROMOTION SERVICE
 ************************************************/
fourStayMicroservices.promotionService -> fourStayMicroservices.propertyService "Получает сведения об объектах размещения" "JSON / HTTPS" {
    tags "Data Flow"
}

/************************************************
 * PROPERTY SERVICE
 ************************************************/
fourStayMicroservices.propertyService -> fourStayMicroservices.contentService "Получает медиафайлы объектов размещения" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.propertyService -> fourStayMicroservices.dictionaryService "Получает типы размещения, локации и удобства" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.propertyService -> fourStayMicroservices.organisationService "Получает сведения о владельце объекта размещения" "JSON / HTTPS" {
    tags "Data Flow"
}

/************************************************
 * REVIEW SERVICE
 ************************************************/
fourStayMicroservices.reviewService -> fourStayMicroservices.bookingService "Проверяет завершённые бронирования" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.reviewService -> fourStayMicroservices.propertyService "Получает информацию об объектах размещения" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.reviewService -> fourStayMicroservices.userProfileService "Получает данные автора отзыва" "JSON / HTTPS" {
    tags "Data Flow"
}

/************************************************
 * SEARCH SERVICE
 ************************************************/
# ???

/************************************************
 * TASK SERVICE
 ************************************************/
fourStayMicroservices.taskService -> fourStayMicroservices.bookingService "Получает данные бронирований по задаче" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.taskService -> fourStayMicroservices.organisationService "Получает данные организации и сотрудников" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.taskService -> fourStayMicroservices.propertyService "Получает данные объекта размещения" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.taskService -> fourStayMicroservices.userProfileService "Получает данные пользователя" "JSON / HTTPS" {
    tags "Data Flow"
}

/************************************************
 * USER PROFILE SERVICE
 ************************************************/
# ???
