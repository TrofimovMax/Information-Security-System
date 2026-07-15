fourStay = softwareSystem "4Stay (AS-IS)" {
    description "Монолитная веб-платформа для поиска, бронирования и управления временным размещением."

    webApplication = container "Web Application" {
        technology "React"
        description "Frontend-приложение, предоставляющее пользовательский интерфейс для гостей, владельцев размещения, менеджеров, администраторов организаций, сотрудников поддержки и операторов."
    }

    monolithApplication = container "Monolithic Application" {
        technology "Ruby on Rails"
        description "Модульное монолитное backend-приложение, содержащее всю бизнес-логику платформы."

        analyticsModule = component "Analytics Module" {
            description "Dashboard, аналитика и сбор информации об активности пользователей."
        }

        auditModule = component "Audit Module" {
            description "Регистрация действий пользователей, изменений данных и системных событий."
        }

        billingModule = component "Billing Module" {
            description "Управление счетами, тарификацией, позициями счетов и тарифами."
        }

        bookingModule = component "Booking Module" {
            description "Управление жизненным циклом бронирования и резервирования."
        }

        communicationModule = component "Communication Module" {
            description "Управление диалогами, уведомлениями, заметками и взаимодействием с клиентами."
        }

        contentModule = component "Content Management Module" {
            description "Управление лендингами и CMS-контентом."
        }

        conversationModule = component "Conversation Module" {
            description "Управление чатами, диалогами и сообщениями между пользователями."
        }

        dictionaryModule = component "Reference Data Module" {
            description "Управление справочными данными: города, локации, районы, валюты, университеты и пользовательские справочники."
        }

        identityModule = component "Identity Module" {
            description "Аутентификация, авторизация, управление пользователями и OTP."
        }

        importModule = component "Import Module" {
            description "Импорт документов и записей."
        }

        integrationModule = component "Integration Module" {
            description "Интеграция со сторонними сервисами и внешними API."
        }

        inventoryModule = component "Inventory Module" {
            description "Управление инвентарём, календарями доступности, запрещёнными датами и доступностью размещения."
        }

        organisationModule = component "Organisation Module" {
            description "Управление организациями, офисами, партнёрами и университетами."
        }

        paymentGatewayModule = component "Payment Gateway Module" {
            description "Взаимодействие с внешними платёжными системами, обработка платежей, возвратов и выплат."
        }

        paymentModule = component "Payment Module" {
            description "Обработка платежей, выплат и управление финансовыми операциями."
        }

        propertyModule = component "Property Management Module" {
            description "Управление объектами размещения, помещениями, объявлениями и удобствами."
        }

        reviewModule = component "Review Module" {
            description "Управление отзывами, оценками объектов размещения и комментариями пользователей."
        }

        settingsModule = component "Settings Module" {
            description "Настройки приложения и конфигурация системы."
        }

        taskModule = component "Task Module" {
            description "Фоновые задачи и операционные процессы."
        }

        userProfileModule = component "User Profile Module" {
            description "Управление профилями пользователей, контактной информацией и персональными настройками."
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

    objectStorage = container "Object Storage" {
        technology "S3 Compatible Storage"
        description "Хранит изображения объектов размещения, документы и другие статические файлы."
    }
}


/************************************************
 * ПОЛЬЗОВАТЕЛИ
 ************************************************/

# guest — гость платформы, ищет, бронирует и оплачивает жильё.
# host — владелец жилья, управляет объектами размещения и бронированиями.
# manager — менеджер объекта размещения, управляет операциями размещения.
# organisation_admin — администратор организации, управляет организацией, пользователями и ресурсами.
# customer_service — сотрудник службы поддержки, решает вопросы пользователей и проблемы с бронированиями.
# agent — операционный сотрудник, координирует бронирования и помогает клиентам.
# admin — системный администратор платформы, управляет настройками и пользователями системы.

admin -> fourStay.webApplication "Администрирование платформы" "HTTPS"
agent -> fourStay.webApplication "Координация бронирований и поддержка клиентов" "HTTPS"
customer_service -> fourStay.webApplication "Решение проблем с бронированиями и платежами" "HTTPS"
guest -> fourStay.webApplication "Поиск и бронирование жилья" "HTTPS"
host -> fourStay.webApplication "Управление объектами размещения и бронированиями" "HTTPS"
manager -> fourStay.webApplication "Управление операциями размещения" "HTTPS"
organisation_admin -> fourStay.webApplication "Управление организацией, пользователями и объектами" "HTTPS"


/************************************************
 * FRONTEND
 ************************************************/

fourStay.webApplication -> fourStay.monolithApplication "API-запросы" "HTTPS / GraphQL"
fourStay.webApplication -> mapbox "Отображение карт и геоданных" "HTTPS / Mapbox API"


/************************************************
 * БАЗА ДАННЫХ И КЭШ
 ************************************************/

fourStay.monolithApplication -> fourStay.cache "Кэширование сессий и часто используемых данных" "Redis"
fourStay.monolithApplication -> fourStay.database "Чтение и запись данных" "SQL"


/************************************************
 * ВЗАИМОДЕЙСТВИЕ МОДУЛЕЙ МОНОЛИТА
 ************************************************/

fourStay.monolithApplication.analyticsModule -> fourStay.monolithApplication.bookingModule "Сбор статистики бронирований"
fourStay.monolithApplication.analyticsModule -> fourStay.monolithApplication.paymentModule "Сбор статистики платежей"

fourStay.monolithApplication.auditModule -> fourStay.monolithApplication.bookingModule "Регистрация действий пользователей"
fourStay.monolithApplication.auditModule -> fourStay.monolithApplication.identityModule "Регистрация входов пользователей"
fourStay.monolithApplication.auditModule -> fourStay.monolithApplication.paymentModule "Регистрация платёжных операций"

fourStay.monolithApplication.bookingModule -> fourStay.monolithApplication.billingModule "Создание счёта"
fourStay.monolithApplication.bookingModule -> fourStay.monolithApplication.communicationModule "Создание уведомлений"
fourStay.monolithApplication.bookingModule -> fourStay.monolithApplication.conversationModule "Создание диалога"
fourStay.monolithApplication.bookingModule -> fourStay.monolithApplication.identityModule "Получение информации о пользователе"
fourStay.monolithApplication.bookingModule -> fourStay.monolithApplication.inventoryModule "Проверка доступности"
fourStay.monolithApplication.bookingModule -> fourStay.monolithApplication.paymentModule "Инициация платежа"
fourStay.monolithApplication.bookingModule -> fourStay.monolithApplication.propertyModule "Получение информации об объектах размещения"
fourStay.monolithApplication.bookingModule -> fourStay.monolithApplication.reviewModule "Разрешение оставить отзыв"

fourStay.monolithApplication.communicationModule -> fourStay.monolithApplication.identityModule "Получение информации о получателе"

fourStay.monolithApplication.identityModule -> fourStay.monolithApplication.organisationModule "Получение информации о членстве в организации"
fourStay.monolithApplication.identityModule -> fourStay.monolithApplication.userProfileModule "Получение профиля пользователя"

fourStay.monolithApplication.importModule -> fourStay.monolithApplication.propertyModule "Импорт данных объектов размещения"

fourStay.monolithApplication.organisationModule -> fourStay.monolithApplication.propertyModule "Управление принадлежащими объектами размещения"

fourStay.monolithApplication.paymentModule -> fourStay.monolithApplication.billingModule "Обновление статуса счёта"
fourStay.monolithApplication.paymentModule -> fourStay.monolithApplication.paymentGatewayModule "Инициация обработки платежа"

fourStay.monolithApplication.settingsModule -> fourStay.monolithApplication.identityModule "Предоставление конфигурации"


/************************************************
 * ВНЕШНИЕ СИСТЕМЫ
 ************************************************/

fourStay.monolithApplication.communicationModule -> knock "Отправка уведомлений" "JSON / HTTPS"
fourStay.monolithApplication.identityModule -> knock "Аутентификация пользователей и отправка OTP" "JSON / HTTPS"
fourStay.monolithApplication.paymentGatewayModule -> stripe "Обработка платежей" "JSON / HTTPS"
