/************************************************
 * ПОЛЬЗОВАТЕЛИ
 ************************************************/

guest -> fourStay.webApplication "Ищет, бронирует и оплачивает временное жильё" "JSON / HTTPS"
host -> fourStay.webApplication "Публикует и управляет объектами размещения" "JSON / HTTPS"
manager -> fourStay.webApplication "Управляет операциями размещения" "JSON / HTTPS"
organisation_admin -> fourStay.webApplication "Администрирует организацию и ресурсы размещения" "JSON / HTTPS"
customer_service -> fourStay.webApplication "Обрабатывает обращения пользователей" "JSON / HTTPS"
agent -> fourStay.webApplication "Координирует бронирования и помогает клиентам" "JSON / HTTPS"
admin -> fourStay.webApplication "Администрирует платформу" "JSON / HTTPS"


/************************************************
 * FRONTEND
 ************************************************/

fourStay.webApplication -> fourStay.monolithApplication "Выполняет API-запросы" "JSON / HTTPS"
fourStay.webApplication -> fourStay.objectStorage "Загружает изображения и документы" "HTTPS"

/************************************************
 * ХРАНЕНИЕ ДАННЫХ
 ************************************************/

fourStay.monolithApplication -> fourStay.database "Читает и сохраняет бизнес-данные" "SQL"
fourStay.monolithApplication -> fourStay.cache "Кэширует сессии и часто используемые данные" "Redis"
fourStay.monolithApplication -> fourStay.objectStorage "Хранит файлы и медиафайлы" "S3 API"
fourStay.monolithApplication.contentModule -> fourStay.objectStorage "Хранит медиафайлы" "S3 API"

/************************************************
 * ВНЕШНИЕ СИСТЕМЫ
 ************************************************/

fourStay.monolithApplication.paymentModule -> stripe "Обрабатывает платежи" "JSON / HTTPS"
fourStay.monolithApplication.identityModule -> knock "Отправляет OTP и выполняет коммуникации авторизации" "JSON / HTTPS"
fourStay.monolithApplication.inventoryModule -> calendar "Синхронизирует календарь доступности" "HTTPS / iCalendar (.ics)"
fourStay.monolithApplication.propertyModule -> mapbox "Получает геоданные и отображение карт" "HTTPS / Mapbox API"


/************************************************
 * КОМПОНЕНТЫ МОНОЛИТА
 ************************************************/

fourStay.monolithApplication.analyticsModule -> fourStay.monolithApplication.dashboardModule "Предоставляет аналитические показатели"
fourStay.monolithApplication.analyticsModule -> fourStay.monolithApplication.bookingModule "Получает данные о бронированиях"
fourStay.monolithApplication.analyticsModule -> fourStay.monolithApplication.paymentModule "Получает данные о платежах"


fourStay.monolithApplication.bookingModule -> fourStay.monolithApplication.auditModule "Журналирует изменения бронирований"
fourStay.monolithApplication.bookingModule -> fourStay.monolithApplication.billingModule "Создает счета"
fourStay.monolithApplication.bookingModule -> fourStay.monolithApplication.calendarModule "Синхронизирует календарь бронирований"
fourStay.monolithApplication.bookingModule -> fourStay.monolithApplication.communicationModule "Создает события бронирования"
fourStay.monolithApplication.bookingModule -> fourStay.monolithApplication.inventoryModule "Проверяет доступность размещения"
fourStay.monolithApplication.bookingModule -> fourStay.monolithApplication.identityModule "Получает данные пользователя"
fourStay.monolithApplication.bookingModule -> fourStay.monolithApplication.paymentModule "Инициирует платеж"
fourStay.monolithApplication.bookingModule -> fourStay.monolithApplication.propertyModule "Получает информацию об объектах размещения"
fourStay.monolithApplication.bookingModule -> fourStay.monolithApplication.reviewModule "Создает возможность оставить отзыв"
fourStay.monolithApplication.bookingModule -> fourStay.monolithApplication.userProfileModule "Получает профиль пользователя"

fourStay.monolithApplication.billingModule -> fourStay.monolithApplication.dictionaryModule "Получает валюты"

fourStay.monolithApplication.calendarModule -> fourStay.monolithApplication.inventoryModule "Импортирует изменения календаря"

fourStay.monolithApplication.contentModule -> fourStay.monolithApplication.dictionaryModule "Получает справочные данные"

fourStay.monolithApplication.communicationModule -> fourStay.monolithApplication.identityModule "Получает данные получателей"
fourStay.monolithApplication.communicationModule -> fourStay.monolithApplication.userProfileModule "Получает информацию о получателях"

fourStay.monolithApplication.dashboardModule -> fourStay.monolithApplication.bookingModule "Получает статистику бронирований"
fourStay.monolithApplication.dashboardModule -> fourStay.monolithApplication.paymentModule "Получает финансовые показатели"

fourStay.monolithApplication.identityModule -> fourStay.monolithApplication.auditModule "Журналирует события аутентификации"
fourStay.monolithApplication.identityModule -> fourStay.monolithApplication.organisationModule "Получает информацию о членстве в организации"

fourStay.monolithApplication.inventoryModule -> fourStay.monolithApplication.calendarModule "Обновляет доступность объектов"

fourStay.monolithApplication.importModule -> fourStay.monolithApplication.propertyModule "Импортирует данные объектов размещения"

fourStay.monolithApplication.organisationModule -> fourStay.monolithApplication.auditModule "Журналирует изменения организаций"
fourStay.monolithApplication.organisationModule -> fourStay.monolithApplication.dictionaryModule "Получает данные университетов"
fourStay.monolithApplication.organisationModule -> fourStay.monolithApplication.propertyModule "Управляет объектами организации"
fourStay.monolithApplication.organisationModule -> fourStay.monolithApplication.userProfileModule "Получает участников организации"

fourStay.monolithApplication.paymentModule -> fourStay.monolithApplication.auditModule "Журналирует платежные операции"
fourStay.monolithApplication.paymentModule -> fourStay.monolithApplication.billingModule "Обновляет статус счетов"
fourStay.monolithApplication.paymentModule -> fourStay.monolithApplication.integrationModule "Использует внешние платежные интеграции"

fourStay.monolithApplication.promotionModule -> fourStay.monolithApplication.bookingModule "Предоставляет скидки"
fourStay.monolithApplication.promotionModule -> fourStay.monolithApplication.propertyModule "Применяет акции к объектам размещения"

fourStay.monolithApplication.propertyModule -> fourStay.monolithApplication.dictionaryModule "Получает справочные данные"

fourStay.monolithApplication.reviewModule -> fourStay.monolithApplication.bookingModule "Проверяет завершение бронирования"
fourStay.monolithApplication.reviewModule -> fourStay.monolithApplication.propertyModule "Связывает отзыв с объектом размещения"

fourStay.monolithApplication.requestModule -> fourStay.monolithApplication.bookingModule "Создает бронирование"
fourStay.monolithApplication.requestModule -> fourStay.monolithApplication.organisationModule "Проверяет принадлежность организации"

fourStay.monolithApplication.settingsModule -> fourStay.monolithApplication.identityModule "Передает конфигурацию авторизации"

fourStay.monolithApplication.taskModule -> fourStay.monolithApplication.bookingModule "Запускает фоновые процессы бронирований"
fourStay.monolithApplication.taskModule -> fourStay.monolithApplication.paymentModule "Запускает фоновые платежные процессы"
