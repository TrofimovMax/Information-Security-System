fourStay = softwareSystem "4Stay" {
    description "Web platform for searching, booking, and managing temporary accommodation for students during university sessions."

    webApplication = container "Web Application" {
        technology "React"
        description "Frontend application providing user interface for students, university staff, accommodation providers and support agents."
    }

    monolithApplication = container "Monolithic Application" {
        technology "Ruby on Rails"
        description "Modular monolithic backend containing all business logic of the platform."

        authenticationModule = component "Authentication Module" {
            description "Handles user authentication, authorization and role management."
        }

        userModule = component "User Management Module" {
            description "Manages users, profiles and permissions."
        }

        accommodationModule = component "Accommodation Module" {
            description "Manages accommodation listings, availability and rental information."
        }

        bookingModule = component "Booking Module" {
            description "Handles booking lifecycle from creation to completion."
        }

        paymentModule = component "Payment Module" {
            description "Processes payments and integrates with external payment provider."
        }

        notificationModule = component "Notification Module" {
            description "Generates and sends notifications about booking events."
        }

        supportModule = component "Support Module" {
            description "Handles customer requests, complaints and booking issues."
        }

        administrationModule = component "Administration Module" {
            description "Provides administrative operations and system management."
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

student -> fourStay "Searches accommodation, creates bookings and makes payments"
universityStaff -> fourStay "Monitors accommodation requests and booking information"
hotelStaff -> fourStay "Manages hotel listings and bookings"
landlord -> fourStay "Publishes rental properties and manages bookings"
supportAgent -> fourStay "Provides customer support and resolves issues"

fourStay.webApplication -> fourStay.monolithApplication "Sends API requests" "HTTPS / REST"
fourStay.monolithApplication -> fourStay.database "Reads and writes application data" "SQL"
fourStay.monolithApplication -> fourStay.cache "Stores temporary data" "Redis Protocol"
fourStay.monolithApplication.paymentModule -> stripe "Processes payments" "HTTPS / REST API"

fourStay.monolithApplication.authenticationModule -> fourStay.monolithApplication.userModule "Loads user roles and permissions"
fourStay.monolithApplication.bookingModule -> fourStay.monolithApplication.accommodationModule "Checks accommodation availability"
fourStay.monolithApplication.bookingModule -> fourStay.monolithApplication.userModule "Retrieves user information"
fourStay.monolithApplication.paymentModule -> fourStay.monolithApplication.bookingModule "Updates booking payment status"
fourStay.monolithApplication.notificationModule -> fourStay.monolithApplication.bookingModule "Receives booking events"
fourStay.monolithApplication.supportModule -> fourStay.monolithApplication.bookingModule "Handles booking issues"
fourStay.monolithApplication.administrationModule -> fourStay.monolithApplication.userModule "Manages users and roles"
