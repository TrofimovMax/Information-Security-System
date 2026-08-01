/************************************************
 * ПОЛЬЗОВАТЕЛИ
 ************************************************/

guest -> fourStayMicroservices.guestWebApplication "Ищет, бронирует, оплачивает и продлевает временное жильё" "JSON / HTTPS"
host -> fourStayMicroservices.hostWebApplication "Публикует объекты размещения, управляет доступностью, тарифами и бронированиями" "JSON / HTTPS"
manager -> fourStayMicroservices.hostWebApplication "Управляет объектами, календарями, доступностью, тарифами и бронированиями" "JSON / HTTPS"
organisation_admin -> fourStayMicroservices.operationsWebApplication "Управляет пользователями, настройками организации и связанными ресурсами" "JSON / HTTPS"
customer_service -> fourStayMicroservices.operationsWebApplication "Помогает гостям, решает вопросы проживания, бронирований и взаимодействия с объектами размещения" "JSON / HTTPS"
agent -> fourStayMicroservices.operationsWebApplication "Обрабатывает обращения пользователей, координирует бронирования и передаёт сложные случаи профильным специалистам" "JSON / HTTPS"
admin -> fourStayMicroservices.operationsWebApplication "Управляет конфигурацией системы, пользователями, организациями и обеспечивает функционирование платформы" "JSON / HTTPS"
