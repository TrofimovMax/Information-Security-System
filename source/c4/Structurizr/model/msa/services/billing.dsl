billingService = container "Billing Service" {
    technology "Ruby on Rails"
    description "Управляет счетами, начислениями, оплатами аренды и финансовыми операциями."
}

billingDatabase = container "Billing DB" {
    technology "PostgreSQL"
    description "Хранит счета, начисления, статусы оплаты и финансовые операции."
    tags "Database"
}
