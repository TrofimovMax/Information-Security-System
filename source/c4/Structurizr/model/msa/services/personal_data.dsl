personalDataService = container "Personal Data Service" {
    technology "Ruby on Rails"
    description "Центральное хранилище ПДн (Vault): приём на хранение, шифрование, выдача по запросу, согласия, экспорт и удаление (GDPR / 152-ФЗ)."
    tags "Microservice"
}

personalDataDatabase = container "Personal Data DB" {
    technology "PostgreSQL"
    description "ПДн в зашифрованном виде, ключи шифрования, согласия, журнал запросов."
    tags "Database"
}
