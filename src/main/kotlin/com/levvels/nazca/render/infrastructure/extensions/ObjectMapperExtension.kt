package com.levvels.nazca.render.infrastructure.extensions


import com.fasterxml.jackson.databind.ObjectMapper
import com.fasterxml.jackson.module.kotlin.jacksonObjectMapper
import java.io.ByteArrayOutputStream

fun extensionObjectMapper(): ObjectMapper = jacksonObjectMapper()

fun ObjectMapper.serialize(obj: Any): String {
    // // https://github.com/FasterXML/jackson-docs/wiki/Presentation:-Jackson-Performance
    val outputStream = ByteArrayOutputStream()
    this.writeValue(outputStream, obj)
    return outputStream.toString()
}
