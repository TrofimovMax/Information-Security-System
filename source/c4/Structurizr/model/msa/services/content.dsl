contentService = container "Content Service" {
    technology "Ruby on Rails"
    description "Управляет CMS-контентом платформы: landing pages, информационными блоками, изображениями, описаниями университетов, локаций и маркетинговыми материалами."
}

contentDatabase = container "Content DB" {
    technology "PostgreSQL"
    description "Хранит страницы, CMS-блоки, тексты, настройки отображения и метаданные контента."
    tags "Database"
}
