dictionaryService = container "Dictionary Service" {
    technology "Ruby on Rails"
    description "Предоставляет справочные данные, включая города, локации, валюты, районы, университеты и другие справочники."
}

dictionaryDatabase = container "Dictionary DB" {
    technology "PostgreSQL"
    description "Хранит справочные данные, включая города, локации, валюты, районы, университеты и другие справочники."
    tags "Database"
}
