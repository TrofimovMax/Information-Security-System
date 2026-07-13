billingService = container "Billing Service" {
    technology "Ruby on Rails"
    description "Управляет выставлением счетов, тарифами и расчётами."
}

billingDatabase = container "Billing DB" {
    technology "PostgreSQL"
    description "Хранит счета, тарифы, начисления и расчётные данные."
    tags "Database"
}
