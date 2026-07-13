propertyService = container "Property Service" {
    technology "Ruby on Rails"
    description "Управляет объектами недвижимости, объявлениями, помещениями и удобствами."
}

propertyDatabase = container "Property DB" {
    technology "PostgreSQL"
    description "Хранит объекты недвижимости, объявления, помещения и информацию об удобствах."
    tags "Database"
}
