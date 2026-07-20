bookingService = container "Booking Service" {
    technology "Ruby on Rails"
    description "Управляет жизненным циклом бронирований: создание, изменение, продление, отмена и управление статусами проживания гостей."
}

bookingDatabase = container "Booking DB" {
    technology "PostgreSQL"
    description "Хранит бронирования, статусы, даты проживания, связи гостей с объектами размещения и историю изменений."
    tags "Database"
}
