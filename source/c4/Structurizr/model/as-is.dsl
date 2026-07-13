fourStay = softwareSystem "4Stay (AS-IS)" {
    description "Монолитная веб-платформа для поиска, бронирования и управления временным размещением."

    webApplication = container "Web Application" {
        technology "React"
        description "Frontend-приложение, предоставляющее пользовательский интерфейс для гостей, владельцев размещения, менеджеров, администраторов организаций, сотрудников поддержки и операторов."
    }

    monolithApplication = container "Monolithic Application" {
        technology "Ruby on Rails"
        description "Модульное монолитное backend-приложение, содержащее всю бизнес-логику платформы."

        identityModule = component "Identity Module" {
            description "Аутентификация, авторизация, управление пользователями и OTP."
        }

        organisationModule = component "Organisation Module" {
            description "Управление организациями, офисами, партнёрами и университетами."
        }

        propertyModule = component "Property Management Module" {
            description "Управление объектами размещения, помещениями, объявлениями и удобствами."
        }

        inventoryModule = component "Inventory Module" {
            description "Управление инвентарём, календарями доступности, запрещёнными датами и доступностью размещения."
        }

        bookingModule = component "Booking Module" {
            description "Управление жизненным циклом бронирования и резервирования."
        }

        billingModule = component "Billing Module" {
            description "Управление счетами, тарификацией, позициями счетов и тарифами."
        }

        paymentModule = component "Payment Module" {
            description "Обработка платежей, выплат, интеграция со Stripe и управление финансовыми операциями."
        }

        communicationModule = component "Communication Module" {
            description "Управление диалогами, уведомлениями, заметками и взаимодействием с клиентами."
        }

        contentModule = component "Content Management Module" {
            description "Управление лендингами и CMS-контентом."
        }

        analyticsModule = component "Analytics Module" {
            description "Dashboard, аналитика и сбор информации об активности пользователей."
        }

        importModule = component "Import Module" {
            description "Импорт документов и записей."
        }

        dictionaryModule = component "Reference Data Module" {
            description "Управление справочными данными: города, локации, районы, валюты, университеты и пользовательские справочники."
        }

        settingsModule = component "Settings Module" {
            description "Настройки приложения и конфигурация системы."
        }

        integrationModule = component "Integration Module" {
            description "Интеграция с внешними календарями, Stripe и сторонними сервисами."
        }

        taskModule = component "Task Module" {
            description "Фоновые задачи и операционные процессы."
        }
    }

    database = container "Database" {
        technology "PostgreSQL"
        description "Хранит данные пользователей, объектов размещения, бронирований, платежей и бизнес-информацию платформы."
        tags "Database"
    }

    cache = container "Cache" {
        technology "Redis"
        description "Хранит сессии, временные данные и часто используемую информацию."
        tags "Database"
    }
}

# guest — гость платформы, ищет, бронирует и оплачивает жильё.
# host — владелец жилья, управляет объектами размещения и бронированиями.
# manager — менеджер объекта размещения, управляет операциями размещения.
# organisation_admin — администратор организации, управляет организацией, пользователями и ресурсами.
# customer_service — сотрудник службы поддержки, решает вопросы пользователей и проблемы с бронированиями.
# agent — операционный сотрудник, координирует бронирования и помогает клиентам.
# admin — системный администратор платформы, управляет настройками и пользователями системы.

guest -> fourStay.webApplication "Поиск и бронирование жилья" "HTTPS"
host -> fourStay.webApplication "Управление объектами размещения и бронированиями" "HTTPS"
manager -> fourStay.webApplication "Управление операциями размещения" "HTTPS"
organisation_admin -> fourStay.webApplication "Управление организацией, пользователями и объектами" "HTTPS"
customer_service -> fourStay.webApplication "Решение проблем с бронированиями и платежами" "HTTPS"
agent -> fourStay.webApplication "Координация бронирований и поддержка клиентов" "HTTPS"
admin -> fourStay.webApplication "Администрирование платформы" "HTTPS"

fourStay.webApplication -> fourStay.monolithApplication "API-запросы" "HTTPS / GraphQL"
fourStay.monolithApplication -> fourStay.database "Чтение и запись данных" "SQL"
fourStay.monolithApplication -> fourStay.cache "Кэширование сессий и часто используемых данных" "Redis"
fourStay.monolithApplication.paymentModule -> stripe "Обработка платежей" "HTTPS / REST API"

fourStay.monolithApplication.identityModule -> fourStay.monolithApplication.organisationModule "Получение информации о членстве в организации"
fourStay.monolithApplication.bookingModule -> fourStay.monolithApplication.propertyModule "Получение информации об объектах размещения"
fourStay.monolithApplication.bookingModule -> fourStay.monolithApplication.inventoryModule "Проверка доступности"
fourStay.monolithApplication.bookingModule -> fourStay.monolithApplication.identityModule "Получение информации о пользователе"
fourStay.monolithApplication.bookingModule -> fourStay.monolithApplication.billingModule "Создание счёта"
fourStay.monolithApplication.bookingModule -> fourStay.monolithApplication.paymentModule "Инициация платежа"
fourStay.monolithApplication.bookingModule -> fourStay.monolithApplication.communicationModule "Публикация событий бронирования"
fourStay.monolithApplication.paymentModule -> fourStay.monolithApplication.billingModule "Обновление статуса счёта"
fourStay.monolithApplication.paymentModule -> fourStay.monolithApplication.integrationModule "Вызов Stripe"
fourStay.monolithApplication.communicationModule -> fourStay.monolithApplication.identityModule "Получение информации о получателе"
fourStay.monolithApplication.analyticsModule -> fourStay.monolithApplication.bookingModule "Сбор статистики бронирований"
fourStay.monolithApplication.analyticsModule -> fourStay.monolithApplication.paymentModule "Сбор статистики платежей"
fourStay.monolithApplication.importModule -> fourStay.monolithApplication.propertyModule "Импорт данных объектов размещения"
fourStay.monolithApplication.settingsModule -> fourStay.monolithApplication.identityModule "Предоставление конфигурации"
fourStay.monolithApplication.organisationModule -> fourStay.monolithApplication.propertyModule "Управление принадлежащими объектами размещения"
