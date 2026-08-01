reconciliationService = container "Reconciliation Service" {
    technology "Ruby on Rails"
    description "Формирует реестры платежей и комиссий (для Stripe и для Host), загружает внешние реестры, сверяет операции и выявляет расхождения."
    tags "Microservice"
}

reconciliationDatabase = container "Reconciliation DB" {
    technology "PostgreSQL"
    description "Реестры платежей, внешние реестры, результаты сверки, расхождения."
    tags "Database"
}
