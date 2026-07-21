searchService = container "Search Service" {
    technology "Ruby on Rails"
    description "Предоставляет быстрый поиск жилья, хранит агрегированный поисковый индекс объектов размещения, доступности, календарей и справочных данных. Обновляет индекс по событиям Kafka."
}

searchDatabase = container "Search Index" {
    technology "Elasticsearch"
    description "Хранит поисковый индекс объектов размещения, фильтров и доступности."
    tags "Database"
}
