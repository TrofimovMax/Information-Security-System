inventoryService = container "Inventory Service" {
    technology "Ruby on Rails"
    description "Управляет доступностью объектов, календарями, инвентарём и недоступными датами."
}

inventoryDatabase = container "Inventory DB" {
    technology "PostgreSQL"
    description "Хранит данные о доступности, календарях, недоступных датах и блокировках бронирований."
    tags "Database"
}
