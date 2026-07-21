workspace "4Stay" "Architecture documentation" {
    !identifiers hierarchical
    model {
        !include model/common/people.dsl
        !include model/common/external-systems.dsl

        !include model/monolith/infrastructure.dsl
        !include model/msa/infrastructure.dsl
    }

    views {
        theme themes/theme.json

        !include views/monolith.dsl
        !include views/msa.dsl
    }
}
