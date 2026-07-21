paymentGateway = container "Payment Gateway" {
    technology "Ruby on Rails"
    description "Инкапсулирует взаимодействие с внешними платёжными системами, выполняет обработку платежей, возвратов, выплат и маршрутизацию запросов к платёжным провайдерам."
    tags "API Gateway"
}

paymentGatewayDatabase = container "Payment Gateway DB" {
    technology "PostgreSQL"
    description "Хранит журналы взаимодействия с платёжными провайдерами, идентификаторы внешних транзакций, результаты обработки запросов и технические логи."
    tags "Database"
}
