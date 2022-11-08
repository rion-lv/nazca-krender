package com.levvels.nazca.render.domain.model
import com.levvels.nazca.render.domain.config.SasProperties
import com.levvels.nazca.render.domain.util.TemplateUtils
@Suppress("unused")
class FtlData(
        val parameters:MutableMap<String,String>,
        val templateUtils: TemplateUtils,
        sasProperties: SasProperties
) {
    val platform: String? = null
    var sasUrlPrefix = "${sasProperties.host}:${sasProperties.port}/nazca/sas/search"
    var autoCompleteUrlPrefix = "${sasProperties.host}:${sasProperties.port}/nazca/autoComplete/search"
}
