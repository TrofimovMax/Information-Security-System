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

    !include analytics-service.dsl
    !include audit-service.dsl
    !include billing-service.dsl
    !include booking-service.dsl
    !include content-service.dsl
    !include conversation-service.dsl
    !include dictionary-service.dsl
    !include identity-service.dsl
    !include import-service.dsl
    !include inventory-service.dsl
    !include notification-service.dsl
    !include organisation-service.dsl
    !include payment-gateway.dsl
    !include payment-service.dsl
    !include property-service.dsl
    !include review-service.dsl
    !include task-service.dsl
    !include user-profile-service.dsl
}
