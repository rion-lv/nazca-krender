package com.levvels.nazca.render.domain.util
import freemarker.template.DefaultObjectWrapperBuilder
import freemarker.template.ObjectWrapper
import freemarker.template.SimpleHash
import freemarker.template.TemplateModel
import org.json.simple.JSONObject
import org.springframework.context.annotation.Configuration
import java.util.concurrent.CopyOnWriteArrayList
@Suppress("unused")
@Configuration
class TemplateUtils() {
    private val defaultObjectWrapper: ObjectWrapper = DefaultObjectWrapperBuilder(freemarker.template.Configuration.VERSION_2_3_31).build()
    val importDataList: CopyOnWriteArrayList<JSONObject> = CopyOnWriteArrayList()

    fun importData(location: String,type:String,timeout: Long): TemplateModel? {
        return importData(location,timeout)
    }
    fun importData(location: String,timeout: Long): TemplateModel? {
        val importedData = JSONObject()
        val s = System.currentTimeMillis()
        try {
            val code: Int = HttpUtil.getApiData(location, "GET", null, null, timeout, importedData)
            val e = System.currentTimeMillis()
            val time = e - s
            importedData["code"] = code
            importedData["path"] = location
            importedData["time"] = time
            importDataList.add(importedData)    // debug mode 호출일 경우, importData 호출 정보를 저장한다.
            lateinit var dataBody: JSONObject
            if (importedData.containsKey("body")) {
                dataBody = importedData["body"] as JSONObject
            }
            return SimpleHash(dataBody, defaultObjectWrapper)
        } catch (e: Exception) {
            val err = JSONObject()
            err["error"] = "Exception : " + e.message
            err["code"] = 500
            importedData["body"] = err
        }
        return null
    }
}