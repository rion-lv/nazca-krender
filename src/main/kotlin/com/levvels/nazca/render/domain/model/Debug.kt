package com.levvels.nazca.render.domain.model
import com.levvels.nazca.render.domain.util.TemplateUtils
import org.json.simple.JSONObject
import kotlin.properties.Delegates
class Debug {
    var renderParam = mutableListOf<MutableMap<String, String>>()
    var tmTotal by Delegates.notNull<Long>()
    var importDatas: MutableList<MutableMap<String, Any>> = mutableListOf()
    lateinit var html: String
    var render: String = "nqapi"

    fun buildRequestParam(param: MutableMap<String, String>): Debug {
        for ((key, value) in param) {
            val m: MutableMap<String, String> = mutableMapOf()
            m["key"] = key
            m["value"] = value
            this.renderParam.add(m)
        }
        return this
    }

    fun buildTmTotal(tmTotal: Long): Debug {
        tmTotal.also { this.tmTotal = it }
        return this
    }
    fun buildImportDatas(templateUtils: TemplateUtils):Debug {

        if(templateUtils.importDataList.isNotEmpty()){
            for(importdata in templateUtils.importDataList){
                val map: MutableMap<String,Any> = mutableMapOf()
                map["time"] = importdata["time"] as Long
                map["path"] = importdata["path"] as String
                map["code"] = importdata["code"] as Int
                val json:JSONObject = importdata["body"] as JSONObject
                map["body"] = json.toJSONString()
                importDatas!!.add(map)
            }
        }
        return this
    }
    fun buildHtml(html: String): Debug {
        html.also { this.html = it }
        return this
    }
}

