paymentService = container "Payment Service" {
    technology "Ruby on Rails"
    description "Управляет жизненным циклом платежей, возвратов, выплат, транзакций и взаимодействует с платежным шлюзом."
}

paymentDatabase = container "Payment DB" {
    technology "PostgreSQL"
    description "Хранит платежи, транзакции, возвраты, выплаты и статусы финансовых операций."
    tags "Database"
}
