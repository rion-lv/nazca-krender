package com.levvels.nazca.render.domain.model

import org.json.simple.JSONObject
import java.util.concurrent.CopyOnWriteArrayList

data class RenderResult (val html:String,val importDataList: CopyOnWriteArrayList<JSONObject>){
}