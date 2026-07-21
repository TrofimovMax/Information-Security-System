promotionService = container "Promotion Service" {
    technology "Ruby on Rails"
    description "Управляет акциями, специальными предложениями, скидками и промо-тарифами для объектов размещения."
    tags "Microservice"
}

promotionDatabase = container "Promotion DB" {
    technology "PostgreSQL"
    description "Хранит акции, специальные цены, периоды действия, условия применения и промо-кампании."
    tags "Database"
}
