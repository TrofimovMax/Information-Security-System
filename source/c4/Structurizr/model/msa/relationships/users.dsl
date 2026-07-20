/************************************************
 * ПОЛЬЗОВАТЕЛИ
 ************************************************/

guest -> fourStayMicroservices.guestWebApplication "Ищет, бронирует и оплачивает жильё" "JSON / HTTPS"
host -> fourStayMicroservices.hostWebApplication "Управляет объектами размещения, доступностью и бронированиями" "JSON / HTTPS"
manager -> fourStayMicroservices.operationsWebApplication "Управляет операциями размещения и бронированиями" "JSON / HTTPS"
customer_service -> fourStayMicroservices.operationsWebApplication "Обрабатывает обращения пользователей и решает проблемы с бронированиями" "JSON / HTTPS"
agent -> fourStayMicroservices.operationsWebApplication "Координирует бронирования и операционные запросы" "JSON / HTTPS"
organisation_admin -> fourStayMicroservices.operationsWebApplication "Администрирует пользователей и ресурсы своей организации" "JSON / HTTPS"
admin -> fourStayMicroservices.operationsWebApplication "Администрирует платформу и системные настройки" "JSON / HTTPS"
