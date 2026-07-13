contentService = container "Content Service" {
    technology "Ruby on Rails"
    description "Управляет лендингами, содержимым CMS и медиаконтентом."
}

contentDatabase = container "Content DB" {
    technology "PostgreSQL"
    description "Хранит лендинги, содержимое CMS, метаданные и конфигурацию страниц."
    tags "Database"
}
