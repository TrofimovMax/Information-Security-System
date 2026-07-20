propertyService = container "Property Service" {
    technology "Ruby on Rails"
    description "Управляет объектами размещения, объявлениями, помещениями, удобствами, изображениями и характеристиками жилья."
}

propertyDatabase = container "Property DB" {
    technology "PostgreSQL"
    description "Хранит объекты размещения, объявления, помещения, удобства, изображения и характеристики жилья."
    tags "Database"
}
