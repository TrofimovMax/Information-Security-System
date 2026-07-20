dictionaryService = container "Dictionary Service" {
    technology "Ruby on Rails"
    description "Управляет справочными данными платформы: города, районы, локации, валюты, университеты, типы размещения и другие общие классификаторы."
}

dictionaryDatabase = container "Dictionary DB" {
    technology "PostgreSQL"
    description "Хранит справочники и классификаторы, используемые бизнес-сервисами платформы."
    tags "Database"
}
