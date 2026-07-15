paymentGateway = container "Payment Gateway" {
    technology "Ruby on Rails"
    description "Обеспечивает взаимодействие с внешними платежными провайдерами, выполняет обработку платежей, возвратов и выплат."
}

paymentGatewayDatabase = container "Payment Gateway DB" {
    technology "PostgreSQL"
    description "Хранит журналы запросов к платежным провайдерам, статусы операций и результаты обработки."
    tags "Database"
}
