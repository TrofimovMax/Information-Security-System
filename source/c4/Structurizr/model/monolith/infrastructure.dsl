fourStay = softwareSystem "4Stay (Monolith)" {
    description "Монолитная веб-платформа для поиска, бронирования и управления временным размещением."

    webApplication = container "Web Application" {
        technology "React"
        description "Веб-приложение, предоставляющее пользовательский интерфейс для гостей, владельцев размещения, менеджеров, администраторов организаций, сотрудников поддержки и операторов."
        tags "Web Application"
    }

    monolithApplication = container "Monolithic Application" {
        technology "Ruby on Rails"
        description "Модульное монолитное backend-приложение, содержащее всю бизнес-логику платформы."

        !include services/analytics.dsl
        !include services/audit.dsl
        !include services/billing.dsl
        !include services/booking.dsl
        !include services/calendar.dsl
        !include services/communication.dsl
        !include services/content.dsl
        !include services/dashboard.dsl
        !include services/dictionary.dsl
        !include services/identity.dsl
        !include services/import.dsl
        !include services/integration.dsl
        !include services/inventory.dsl
        !include services/organisation.dsl
        !include services/payment.dsl
        !include services/property.dsl
        !include services/promotion.dsl
        !include services/request.dsl
        !include services/review.dsl
        !include services/settings.dsl
        !include services/task.dsl
        !include services/user_profile.dsl
    }

    database = container "Database" {
        technology "PostgreSQL"
        description "Хранит данные пользователей, объектов размещения, бронирований, платежей и бизнес-информацию платформы."
        tags "Database"
    }

    cache = container "Cache" {
        technology "Redis"
        description "Хранит сессии, временные данные и часто используемую информацию."
        tags "Cache"
    }

    objectStorage = container "Object Storage" {
        technology "S3 Compatible Storage"
        description "Хранит изображения, документы и другие файлы платформы."
        tags "Object Storage"
    }

}

!include relationships.dsl
