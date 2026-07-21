calendarService = container "Calendar Service" {
    technology "Ruby on Rails"
    description "Управляет календарями доступности объектов размещения, синхронизацией iCal-календарей, блокировками дат и интеграциями с внешними календарными системами."
    tags "Microservice"
}

calendarDatabase = container "Calendar DB" {
    technology "PostgreSQL"
    description "Хранит календари объектов размещения, настройки синхронизации, внешние iCal ссылки и состояние импортированных событий."
    tags "Database"
}
