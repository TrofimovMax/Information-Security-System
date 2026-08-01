postPaymentService = container "Post-Payment Service" {
    technology "Ruby on Rails"
    description "Постплатёжная логика после подтверждения платежа: рассылает события по топикам (нотификации, букинги, аналитика, история платежей)."
    tags "Microservice"
}

postPaymentDatabase = container "Post-Payment DB" {
    technology "PostgreSQL"
    description "Журнал постплатёжных событий и статусов их доставки."
    tags "Database"
}
