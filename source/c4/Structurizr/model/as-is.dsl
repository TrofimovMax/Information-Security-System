fourStay = softwareSystem "4Stay" {
    description "Web platform for searching, booking, and managing temporary accommodation for students during university sessions."

    webApplication = container "Web Application" {
        technology "React"
        description "Frontend application providing user interface for students, university staff, accommodation providers and support agents."
    }

    monolithApplication = container "Monolithic Application" {
        technology "Ruby on Rails"
        description "Modular monolithic backend containing all business logic."

        identityModule = component "Identity Module" {
            description "Authentication, authorization, users and OTP."
        }

        organisationModule = component "Organisation Module" {
            description "Organisations, offices, partners and university management."
        }

        propertyModule = component "Property Management Module" {
            description "Property, units, listings and amenities management."
        }

        inventoryModule = component "Inventory Module" {
            description "Inventories, calendars, disable days and availability."
        }

        bookingModule = component "Booking Module" {
            description "Booking lifecycle and reservation management."
        }

        billingModule = component "Billing Module" {
            description "Invoices, billing, invoice line items and tariffs."
        }

        paymentModule = component "Payment Module" {
            description "Payments, payouts, Stripe integration and financial transactions."
        }

        communicationModule = component "Communication Module" {
            description "Conversations, notifications, notes and customer interactions."
        }

        contentModule = component "Content Management Module" {
            description "Landing pages and CMS content."
        }

        analyticsModule = component "Analytics Module" {
            description "Dashboard, analytics and activity tracking."
        }

        importModule = component "Import Module" {
            description "Import documents and records."
        }

        dictionaryModule = component "Reference Data Module" {
            description "Cities, locations, areas, currencies, universities and custom dictionaries."
        }

        settingsModule = component "Settings Module" {
            description "Application settings and configuration."
        }

        integrationModule = component "Integration Module" {
            description "External calendars, Stripe and third-party integrations."
        }

        taskModule = component "Task Module" {
            description "Background jobs and operational tasks."
        }
    }

    database = container "Database" {
        technology "PostgreSQL"
        description "Stores users, accommodations, bookings, payments and application data."
        tags "Database"
    }

    cache = container "Cache" {
        technology "Redis"
        description "Stores sessions, temporary data and frequently accessed information."
        tags "Database"
    }
}

# guest — студент/гость, ищет и бронирует жильё.
# host — владелец жилья (Landlord).
# manager — сотрудник отеля или управляющий объектами.
# organisation_admin — администратор университета или организации.
# customer_service — сотрудник поддержки.
# agent — операционный сотрудник, координирующий бронирования.
# admin — системный администратор платформы.

guest -> fourStay.webApplication "Searches and books accommodation" "HTTPS"
host -> fourStay.webApplication "Manages properties and bookings" "HTTPS"
manager -> fourStay.webApplication "Manages accommodation operations" "HTTPS"
organisation_admin -> fourStay.webApplication "Manages organisation, users and properties" "HTTPS"
customer_service -> fourStay.webApplication "Resolves booking and payment issues" "HTTPS"
agent -> fourStay.webApplication "Coordinates bookings and supports customers" "HTTPS"
admin -> fourStay.webApplication "Administers the platform" "HTTPS"

fourStay.webApplication -> fourStay.monolithApplication "API requests" "HTTPS / GraphQL"
fourStay.monolithApplication -> fourStay.database "Reads and writes data" "SQL"
fourStay.monolithApplication -> fourStay.cache "Caches sessions and frequently accessed data" "Redis"
fourStay.monolithApplication.paymentModule -> stripe "Processes payments" "HTTPS / REST API"

fourStay.monolithApplication.identityModule -> fourStay.monolithApplication.organisationModule "Loads organisation membership"
fourStay.monolithApplication.bookingModule -> fourStay.monolithApplication.propertyModule "Retrieves property information"
fourStay.monolithApplication.bookingModule -> fourStay.monolithApplication.inventoryModule "Checks availability"
fourStay.monolithApplication.bookingModule -> fourStay.monolithApplication.identityModule "Retrieves customer information"
fourStay.monolithApplication.bookingModule -> fourStay.monolithApplication.billingModule "Creates invoice"
fourStay.monolithApplication.bookingModule -> fourStay.monolithApplication.paymentModule "Initiates payment"
fourStay.monolithApplication.bookingModule -> fourStay.monolithApplication.communicationModule "Publishes booking events"
fourStay.monolithApplication.paymentModule -> fourStay.monolithApplication.billingModule "Updates invoice status"
fourStay.monolithApplication.paymentModule -> fourStay.monolithApplication.integrationModule "Calls Stripe"
fourStay.monolithApplication.communicationModule -> fourStay.monolithApplication.identityModule "Retrieves recipient information"
fourStay.monolithApplication.analyticsModule -> fourStay.monolithApplication.bookingModule "Collects booking statistics"
fourStay.monolithApplication.analyticsModule -> fourStay.monolithApplication.paymentModule "Collects payment statistics"
fourStay.monolithApplication.importModule -> fourStay.monolithApplication.propertyModule "Imports properties"
fourStay.monolithApplication.settingsModule -> fourStay.monolithApplication.identityModule "Provides configuration"
fourStay.monolithApplication.organisationModule -> fourStay.monolithApplication.propertyModule "Manages owned properties"
