paymentService = container "Payment Service" {
    technology "Ruby on Rails"
    description "Обрабатывает платежи, выплаты, финансовые транзакции и интеграцию со Stripe."
}

paymentDatabase = container "Payment DB" {
    technology "PostgreSQL"
    description "Хранит платежи, выплаты, транзакции и финансовые операции."
    tags "Database"
}
