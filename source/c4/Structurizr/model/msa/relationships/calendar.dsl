/************************************************
 * CALENDAR INTEGRATIONS
 ************************************************/

fourStayMicroservices.calendarService -> fourStayMicroservices.inventoryService "Получает данные доступности объектов" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.calendarService -> ical "Импортирует и экспортирует календари доступности" "iCal / HTTPS" {
    tags "Data Flow"
}
