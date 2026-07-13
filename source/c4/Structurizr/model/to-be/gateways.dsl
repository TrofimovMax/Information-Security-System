webApplication = container "Web Application" {
    technology "React"
    description "Веб-приложение, предоставляющее пользовательский интерфейс для всех ролей системы."
}

apiGateway = container "API Gateway" {
    technology "NGINX / GraphQL Gateway"
    description "Единая точка входа для клиентских приложений и маршрутизации запросов к микросервисам."
}
