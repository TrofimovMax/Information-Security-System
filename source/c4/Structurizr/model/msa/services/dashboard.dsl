dashboardService = container "Dashboard Service" {
    technology "Ruby on Rails"
    description "Предоставляет готовые аналитические представления и операционные панели для хостов, менеджеров, администраторов организаций и операторов платформы."
}

dashboardDatabase = container "Dashboard DB" {
    technology "PostgreSQL"
    description "Хранит подготовленные представления дашбордов, пользовательские настройки отображения и сохранённые фильтры."
    tags "Database"
}
