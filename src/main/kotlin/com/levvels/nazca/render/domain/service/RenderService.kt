package com.levvels.nazca.render.domain.service
import com.levvels.nazca.render.domain.config.SasProperties
import com.levvels.nazca.render.domain.model.Debug
import com.levvels.nazca.render.domain.model.FtlData
import com.levvels.nazca.render.domain.model.RenderResult
import com.levvels.nazca.render.domain.util.TemplateUtils
import freemarker.template.Configuration
import freemarker.template.Template
import org.springframework.stereotype.Service
import java.io.StringWriter
import kotlin.jvm.Throws

@Service
class RenderService(
        val serviceConfiguration: Configuration,
        val sasProperties: SasProperties
) {
    @Throws(java.lang.Exception::class)
    fun render(collectionId:String,
               platform:String,
               render:String,
               parameters:MutableMap<String,String>,
               templateUtils:TemplateUtils) : RenderResult {
        val ftlData = FtlData(parameters,templateUtils,sasProperties)
        val html = templateRender(collectionId,platform,render,ftlData)
        return RenderResult(html, templateUtils.importDataList)
    }
    fun templateRender(collectionId:String,platform:String,render:String,ftlData:FtlData):String{
        val templatePath = "${collectionId}/${render}/${platform}/${collectionId}_${platform}.ftl"
        val templateWriter = StringWriter()
        val template: Template = serviceConfiguration.getTemplate(templatePath)
        template.process(ftlData,templateWriter)
        return templateWriter.toString()
    }
    fun debug(debugData: Debug):String{
        val templatePath = "/debug/pc.ftl"
        val templateWriter = StringWriter()
        val template: Template = serviceConfiguration.getTemplate(templatePath)
        template.process(debugData,templateWriter)
        return templateWriter.toString()
    }
}