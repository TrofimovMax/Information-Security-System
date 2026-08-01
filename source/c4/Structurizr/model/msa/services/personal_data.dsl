personalDataService = container "Personal Data Service" {
    technology "Ruby on Rails"
    description "Централизованное хранилище персональных данных (Personal Data Vault). Принимает ПДн от сервисов на хранение, хранит их в шифрованном виде, дешифрует и предоставляет по запросу авторизованным сервисам."
    tags "Microservice"
}

personalDataDatabase = container "Personal Data DB" {
    technology "PostgreSQL"
    description "Хранит персональные данные в шифрованном виде, ключи шифрования, согласия на обработку, журнал запросов на экспорт/удаление/изменение и метаданные обработки ПДн."
    tags "Database"
}
