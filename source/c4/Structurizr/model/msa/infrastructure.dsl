fourStayMicroservices = softwareSystem "4Stay (MSA)" {
    description "Микросервисная архитектура платформы бронирования временного жилья 4Stay."


    /************************************************
     * ТОЧКИ ВХОДА
     ************************************************/

    !include gateways/gateways.dsl


    /************************************************
     * МИКРОСЕРВИСЫ
     ************************************************/

    !include services/services.dsl


    /************************************************
     * ОБЩАЯ ИНФРАСТРУКТУРА
     ************************************************/

    !include infrastructure/caches.dsl
    !include infrastructure/messaging.dsl
    !include infrastructure/storages.dsl
}

/************************************************
 * СВЯЗИ MSA
 ************************************************/

!include relationships.dsl
