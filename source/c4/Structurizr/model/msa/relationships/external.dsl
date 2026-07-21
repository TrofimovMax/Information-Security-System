/************************************************
 * EXTERNAL SYSTEMS
 ************************************************/

fourStayMicroservices.guestWebApplication -> mapbox "Отображает расположение объектов размещения" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.hostWebApplication -> mapbox "Выбор и отображение расположения объектов размещения" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.operationsWebApplication -> mapbox "Отображает географические данные объектов" "HTTPS / Mapbox API" {
    tags "Data Flow"
}
fourStayMicroservices.identityService -> knock "Отправляет OTP-коды и выполняет подтверждение пользователя" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.notificationService -> knock "Отправляет уведомления пользователям" "JSON / HTTPS" {
    tags "Data Flow"
}
fourStayMicroservices.calendarService -> ical "Получает и публикует данные календарей" "JSON / HTTPS" {
    tags "Data Flow"
}
