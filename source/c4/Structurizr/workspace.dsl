workspace "4Stay" "Architecture documentation" {
    !identifiers hierarchical
    model {

        !include model/people.dsl
        !include model/external-systems.dsl
        !include model/as-is.dsl

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
        }

        !include views/context/as-is.dsl
        !include views/container/as-is.dsl
        !include views/component/as-is.dsl
    }
}
