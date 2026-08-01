bookingOrchestrator = container "Booking Orchestrator" {
    technology "Ruby on Rails"
    description "Saga-оркестратор бронирования: координирует создание бронирования через события Kafka, управляет компенсациями при сбоях."
    tags "Microservice"
}

bookingOrchestratorDatabase = container "Booking Orchestrator DB" {
    technology "PostgreSQL"
    description "Хранит состояние Saga-процессов бронирования, шаги и компенсации."
    tags "Database"
}
