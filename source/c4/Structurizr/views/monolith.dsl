systemContext fourStay "SystemContext-Monolith" "Контекстная диаграмма монолитной архитектуры." {
    include *
    autoLayout lr
}

container fourStay "Container-Monolith" "Контейнерная диаграмма монолитной архитектуры." {
    include *
    autoLayout lr
}

component fourStay.monolithApplication "Component-Monolith" "Диаграмма компонентов монолитного приложения." {
    include *
    # autoLayout lr
}
