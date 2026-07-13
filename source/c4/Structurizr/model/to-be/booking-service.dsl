bookingService = container "Booking Service" {
    technology "Ruby on Rails"
    description "Управляет полным жизненным циклом бронирований."
}

bookingDatabase = container "Booking DB" {
    technology "PostgreSQL"
    description "Хранит бронирования, их статусы, историю изменений и связанные данные."
    tags "Database"
}
