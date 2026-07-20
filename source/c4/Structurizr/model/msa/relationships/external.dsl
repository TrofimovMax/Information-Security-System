/************************************************
 * EXTERNAL SYSTEMS
 ************************************************/

fourStayMicroservices.guestWebApplication -> mapbox "Отображает расположение объектов размещения" "HTTPS / Mapbox API"
fourStayMicroservices.hostWebApplication -> mapbox "Выбор и отображение расположения объектов размещения" "HTTPS / Mapbox API"
fourStayMicroservices.operationsWebApplication -> mapbox "Отображает географические данные объектов" "HTTPS / Mapbox API"
fourStayMicroservices.identityService -> knock "Отправляет OTP-коды и выполняет подтверждение пользователя" "JSON / HTTPS"
fourStayMicroservices.notificationService -> knock "Отправляет уведомления пользователям" "JSON / HTTPS"
fourStayMicroservices.calendarService -> ical "Получает и публикует данные календарей" "iCal / HTTPS"
