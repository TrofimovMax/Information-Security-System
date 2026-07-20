/************************************************
 * CALENDAR INTEGRATIONS
 ************************************************/

fourStayMicroservices.calendarService -> fourStayMicroservices.inventoryService "Получает данные доступности объектов" "JSON / HTTPS"
fourStayMicroservices.calendarService -> ical "Импортирует и экспортирует календари доступности" "iCal / HTTPS"
