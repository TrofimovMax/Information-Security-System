feeService = container "Fee Service" {
    technology "Java / Spring Boot"
    description "Рассчитывает комиссии платежных систем, банковские сборы, комиссии за международные переводы, валютные комиссии и итоговую сумму списания."
    tags "Microservice"
}

feeDatabase = container "Fee DB" {
    technology "PostgreSQL"
    description "Хранит тарифы платежных провайдеров, правила расчета комиссий, комиссии по странам, валютам, способам оплаты и временным периодам."
    tags "Database"
}
