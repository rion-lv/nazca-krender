package com.levvels.nazca.render.domain.config
import org.springframework.boot.context.properties.ConfigurationProperties
import org.springframework.stereotype.Component

@Component
@ConfigurationProperties("search.sas")
class SasProperties {
    var host: String? = null
    var port = 0
}