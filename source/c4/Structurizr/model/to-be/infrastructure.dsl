fourStayMicroservices = softwareSystem "4Stay (TO-BE)" {
    description "Микросервисная архитектура платформы бронирования временного жилья 4Stay."

    /************************************************
     * ТОЧКА ВХОДА
     ************************************************/

    !include gateways.dsl

    /************************************************
     * ОБЩАЯ ИНФРАСТРУКТУРА
     ************************************************/

    !include messaging.dsl
    !include caches.dsl
    !include storages.dsl

    /************************************************
     * МИКРОСЕРВИСЫ
     ************************************************/

    !include identity-service.dsl
    !include organisation-service.dsl
    !include property-service.dsl
    !include inventory-service.dsl
    !include booking-service.dsl
    !include billing-service.dsl
    !include payment-service.dsl
    !include notification-service.dsl
    !include analytics-service.dsl
    !include content-service.dsl
    !include dictionary-service.dsl
    !include import-service.dsl
    !include task-service.dsl
}
