workspace "4Stay" "Architecture documentation" {
    !identifiers hierarchical
    model {
        !include model/common/people.dsl
        !include model/common/external-systems.dsl

        !include model/monolith/infrastructure.dsl
        !include model/msa/infrastructure.dsl
    }

    views {
        theme default

        styles {
            element "Person" {
                shape Person
            }

            element "Database" {
                shape Cylinder
            }

            element "External" {
                background #999999
                color #ffffff
            }
        }

        !include views/monolith.dsl
        !include views/msa.dsl
    }
}
