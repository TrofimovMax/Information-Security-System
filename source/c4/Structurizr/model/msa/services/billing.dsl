billingService = container "Billing Service" {
    technology "Ruby on Rails"
    description "Создаёт invoice после создания букинга и расчёта стоимости, управляет счетами, начислениями и финансовыми операциями."
    tags "Microservice"
}

billingDatabase = container "Billing DB" {
    technology "PostgreSQL"
    description "Хранит invoice, счета, начисления, статусы оплаты и финансовые операции."
    tags "Database"
}
