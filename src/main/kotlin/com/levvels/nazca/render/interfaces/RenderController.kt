package com.levvels.nazca.render.interfaces
import com.levvels.nazca.render.domain.model.Debug
import com.levvels.nazca.render.domain.service.RenderService
import org.springframework.http.HttpHeaders
import org.springframework.http.HttpStatus
import org.springframework.http.MediaType
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*
@RestController
@RequestMapping("/nazca")
class RenderController(
        private val renderService: RenderService
) {
    @ResponseBody
    @RequestMapping(value = ["/render"], produces = [MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE], method = [RequestMethod.GET])
    @Throws(Exception::class)
    fun renderGet(@RequestParam parameters: MutableMap<String, String>): ResponseEntity<String> {
        val collectionId = parameters["collectionId"] ?: throw java.lang.Exception("collectionId 는 필수 파라미터입니다")
        val platform = parameters["platform"]?:"m"
        val render = parameters["render"]?:"nqapi"
        val html: String = renderService.render(collectionId,platform,render, parameters)
        return response(html)
    }

    @ResponseBody
    @RequestMapping(value = ["/debug"], produces = [MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE], method = [RequestMethod.GET])
    @Throws(java.lang.Exception::class)
    fun debugGet(@RequestParam parameters: MutableMap<String, String>): ResponseEntity<String> {
        val collectionId = parameters["collectionId"] ?: throw java.lang.Exception("collectionId 는 필수 파라미터입니다")
        val platform = parameters["platform"]?:"m"
        val render = parameters["render"]?:"nqapi"

        // Rendering
        val s = System.currentTimeMillis()
        val html = renderService.render(collectionId, platform, render, parameters)

        // Response
        val debugData: Debug = Debug().buildTmTotal(System.currentTimeMillis() - s)
                .buildRequestParam(parameters)
                .buildImportDatas(renderService.templateUtils)
                .buildHtml(html)
        val debugPage = renderService.debug(debugData)
        val responseHeaders = HttpHeaders()
        responseHeaders.add(HttpHeaders.CONTENT_TYPE, "text/html; charset=UTF-8")
        return ResponseEntity(debugPage, responseHeaders, HttpStatus.OK)
    }


    @Throws(java.lang.Exception::class)
    private fun response(html: String): ResponseEntity<String> {
        val responseHeaders = HttpHeaders()
        var trimHtml = ""
        if (html.isNotEmpty()) {
            trimHtml = html.trim()
            if (trimHtml.startsWith("{") || trimHtml.startsWith("[")) {
                responseHeaders.contentType = MediaType.APPLICATION_JSON
            } else {
                MediaType.TEXT_HTML_VALUE
                responseHeaders.add(HttpHeaders.CONTENT_TYPE, "text/html; charset=UTF-8")
            }
        } else {
            responseHeaders.add(HttpHeaders.CONTENT_TYPE, "text/html; charset=UTF-8")
        }
        return ResponseEntity<String>(trimHtml, responseHeaders, HttpStatus.OK)
    }
    @RequestMapping(value = ["/render/health"], method = [RequestMethod.GET])
    @ResponseBody
    @Throws(java.lang.Exception::class)
    fun health(@RequestParam parameters: Map<String?, String?>?): ResponseEntity<*>? {
        return ResponseEntity<Any?>("live", HttpStatus.OK)
    }
}