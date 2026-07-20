inventoryService = container "Inventory Service" {
    technology "Ruby on Rails"
    description "Управляет доступностью объектов размещения, календарями, блокировками дат, остатками размещения и предотвращением двойного бронирования."
}

inventoryDatabase = container "Inventory DB" {
    technology "PostgreSQL"
    description "Хранит данные календарей доступности, блокировок, ограничений размещения и состояния инвентаря."
    tags "Database"
}
