guestApi = container "Guest API Gateway" {
    technology "REST API"
    description "REST API для студентов и арендаторов."
}

hostApi = container "Host API Gateway" {
    technology "REST API"
    description "REST API для арендодателей."
}

operationsApi = container "Operations API Gateway" {
    technology "REST API"
    description "REST API для сотрудников платформы и организаций."
}
!include web_application.dsl

fourStayMicroservices.guestWebApplication -> fourStayMicroservices.guestApi "REST API запросы" "HTTPS / JSON"
fourStayMicroservices.hostWebApplication -> fourStayMicroservices.hostApi "REST API запросы" "HTTPS / JSON"
fourStayMicroservices.operationsWebApplication -> fourStayMicroservices.operationsApi "REST API запросы" "HTTPS / JSON"
