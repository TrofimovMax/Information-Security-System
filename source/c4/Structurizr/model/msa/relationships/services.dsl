fourStayMicroservices.analyticsService -> fourStayMicroservices.dashboardService "Передает агрегированные аналитические данные" "JSON / HTTPS"

fourStayMicroservices.billingService -> fourStayMicroservices.dictionaryService "Получает информацию о валютах" "JSON / HTTPS"
fourStayMicroservices.billingService -> fourStayMicroservices.organisationService "Получает сведения об организациях для выставления счетов" "JSON / HTTPS"

fourStayMicroservices.bookingService -> fourStayMicroservices.billingService "Рассчитывает стоимость бронирования" "JSON / HTTPS"
fourStayMicroservices.bookingService -> fourStayMicroservices.calendarService "Обновляет календарь после изменения бронирования" "JSON / HTTPS"
fourStayMicroservices.bookingService -> fourStayMicroservices.dictionaryService "Получает валюты и параметры бронирования" "JSON / HTTPS"
fourStayMicroservices.bookingService -> fourStayMicroservices.inventoryService "Проверяет доступность объекта и резервирует доступность объектов на период проживания" "JSON / HTTPS"
fourStayMicroservices.bookingService -> fourStayMicroservices.paymentService "Инициирует оплату бронирования" "JSON / HTTPS"
fourStayMicroservices.bookingService -> fourStayMicroservices.promotionService "Получает применимые акции и специальные цены" "JSON / HTTPS"
fourStayMicroservices.bookingService -> fourStayMicroservices.propertyService "Получает сведения об объектах размещения" "JSON / HTTPS"
fourStayMicroservices.bookingService -> fourStayMicroservices.userProfileService "Получает данные гостя" "JSON / HTTPS"

fourStayMicroservices.calendarService -> fourStayMicroservices.inventoryService "Получает и обновляет данные доступности" "JSON / HTTPS"
fourStayMicroservices.calendarService -> fourStayMicroservices.propertyService "Получает данные объектов размещения и помещений" "JSON / HTTPS"

fourStayMicroservices.contentService -> fourStayMicroservices.dictionaryService "Получает справочные данные для формирования страниц" "JSON / HTTPS"
fourStayMicroservices.contentService -> fourStayMicroservices.propertyService "Получает информацию об объектах размещения для отображения" "JSON / HTTPS"
fourStayMicroservices.contentService -> fourStayMicroservices.organisationService "Получает данные организаций для формирования страниц" "JSON / HTTPS"

fourStayMicroservices.conversationService -> fourStayMicroservices.notificationService "Передает события отправки сообщений для уведомления пользователей" "JSON / HTTPS"
fourStayMicroservices.conversationService -> fourStayMicroservices.taskService "Создает задачи из обращений пользователей" "JSON / HTTPS"
fourStayMicroservices.conversationService -> fourStayMicroservices.userProfileService "Получает данные пользователей и участников диалогов" "JSON / HTTPS"

fourStayMicroservices.identityService -> fourStayMicroservices.organisationService "Проверяет членство и права пользователя в организации" "JSON / HTTPS"
fourStayMicroservices.identityService -> fourStayMicroservices.userProfileService "Получает данные профиля пользователя" "JSON / HTTPS"

fourStayMicroservices.importService -> fourStayMicroservices.dictionaryService "Получает справочные данные для проверки импортируемых записей" "JSON / HTTPS"
fourStayMicroservices.importService -> fourStayMicroservices.inventoryService "Импортирует данные доступности объектов" "JSON / HTTPS"
fourStayMicroservices.importService -> fourStayMicroservices.organisationService "Импортирует организации и участников" "JSON / HTTPS"
fourStayMicroservices.importService -> fourStayMicroservices.propertyService "Импортирует объекты размещения" "JSON / HTTPS"
fourStayMicroservices.importService -> fourStayMicroservices.userProfileService "Импортирует профили пользователей" "JSON / HTTPS"

fourStayMicroservices.inventoryService -> fourStayMicroservices.calendarService "Синхронизирует календари доступности" "JSON / HTTPS"
fourStayMicroservices.inventoryService -> fourStayMicroservices.dictionaryService "Получает справочные данные" "JSON / HTTPS"
fourStayMicroservices.inventoryService -> fourStayMicroservices.propertyService "Получает сведения об объектах размещения" "JSON / HTTPS"

fourStayMicroservices.landingService -> fourStayMicroservices.contentService "Получает CMS-контент" "JSON / HTTPS"
fourStayMicroservices.landingService -> fourStayMicroservices.dictionaryService "Получает города, университеты и районы" "JSON / HTTPS"
fourStayMicroservices.landingService -> fourStayMicroservices.propertyService "Получает популярные объекты размещения" "JSON / HTTPS"
fourStayMicroservices.landingService -> fourStayMicroservices.inventoryService "Получает информацию о доступности" "JSON / HTTPS"
fourStayMicroservices.landingService -> fourStayMicroservices.promotionService "Получает активные акции" "JSON / HTTPS"

fourStayMicroservices.notificationService -> fourStayMicroservices.userProfileService "Получает контактные данные и настройки уведомлений пользователя" "JSON / HTTPS"

fourStayMicroservices.organisationService -> fourStayMicroservices.userProfileService "Получает сведения о пользователях организации" "JSON / HTTPS"

fourStayMicroservices.paymentService -> fourStayMicroservices.billingService "Обновляет статус оплаты счета" "JSON / HTTPS"
fourStayMicroservices.paymentService -> fourStayMicroservices.dictionaryService "Получает поддерживаемые валюты" "JSON / HTTPS"

fourStayMicroservices.promotionService -> fourStayMicroservices.propertyService "Получает сведения об объектах размещения" "JSON / HTTPS"

fourStayMicroservices.propertyService -> fourStayMicroservices.contentService "Получает медиафайлы объектов размещения" "JSON / HTTPS"
fourStayMicroservices.propertyService -> fourStayMicroservices.dictionaryService "Получает типы размещения, локации и удобства" "JSON / HTTPS"
fourStayMicroservices.propertyService -> fourStayMicroservices.organisationService "Получает сведения о владельце объекта размещения" "JSON / HTTPS"

fourStayMicroservices.reviewService -> fourStayMicroservices.bookingService "Проверяет завершённые бронирования" "JSON / HTTPS"
fourStayMicroservices.reviewService -> fourStayMicroservices.propertyService "Получает информацию об объектах размещения" "JSON / HTTPS"
fourStayMicroservices.reviewService -> fourStayMicroservices.userProfileService "Получает данные автора отзыва" "JSON / HTTPS"

fourStayMicroservices.taskService -> fourStayMicroservices.bookingService "Получает данные бронирований по задаче" "JSON / HTTPS"
fourStayMicroservices.taskService -> fourStayMicroservices.organisationService "Получает данные организации и сотрудников" "JSON / HTTPS"
fourStayMicroservices.taskService -> fourStayMicroservices.propertyService "Получает данные объекта размещения" "JSON / HTTPS"
fourStayMicroservices.taskService -> fourStayMicroservices.userProfileService "Получает данные пользователя" "JSON / HTTPS"
