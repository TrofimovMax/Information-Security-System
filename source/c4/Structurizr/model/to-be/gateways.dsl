webApplication = container "Web Application" {
    technology "React"
    description "Веб-приложение, предоставляющее пользовательский интерфейс для всех ролей системы."
}

guestApi = container "Guest API" {
    technology "REST API"
    description "REST API для гостей платформы."
}

hostApi = container "Host API" {
    technology "REST API"
    description "REST API для владельцев объектов размещения."
}

operationsApi = container "Operations API" {
    technology "REST API"
    description "REST API для сотрудников платформы."
}
