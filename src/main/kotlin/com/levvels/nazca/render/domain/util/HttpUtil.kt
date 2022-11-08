package com.levvels.nazca.render.domain.util
import okhttp3.*
import okhttp3.MediaType.Companion.toMediaTypeOrNull
import okhttp3.RequestBody.Companion.toRequestBody
import org.json.simple.JSONObject
import org.json.simple.parser.JSONParser
import org.springframework.context.annotation.Configuration
import java.util.concurrent.TimeUnit
@Configuration
class HttpUtil {

    companion object {
        private var client = OkHttpClient.Builder()
                .retryOnConnectionFailure(true)
                .connectTimeout(100, TimeUnit.MILLISECONDS)
                .readTimeout(1000, TimeUnit.MILLISECONDS)
                .build()

        @JvmStatic
        @Throws(java.lang.Exception::class)
        fun getApiData(url: String,
                       method: String,
                       headerMap: Map<String, String>?,
                       body: String?,
                       timeout: Long,
                       importedData: JSONObject): Int {
            //map을 Headers로 변환
            val headerBuilder = Headers.Builder()
            headerMap?.let {
                for ((key, value) in it) {
                    headerBuilder.add(key, value)
                }
            }
            headerBuilder.add("Connection", "close")
            val apiHeader = headerBuilder.build()
            var request: Request? = null
            if (method == "GET") {
                request = Request.Builder().get().url(url).headers(apiHeader).build()
            } else if (method == "POST") {
                if (body != null) {
                    val requestBody = body.toRequestBody("application/json; charset=utf-8".toMediaTypeOrNull())
                    request = Request.Builder().method("POST", requestBody).headers(apiHeader).url(url).build()
                }
            }
            val okHttpClient = this.client.newBuilder().readTimeout(timeout, TimeUnit.MILLISECONDS).build()

            if (request != null) {
                try {
                    val response = okHttpClient.newCall(request).execute()
                    val bodyString = response.body?.string()
                    val parser = JSONParser()
                    val json = parser.parse(bodyString) as JSONObject
                    importedData["code"] = response.code
                    importedData["body"] = json
                } catch (e: Exception) {
                    val err = JSONObject()
                    err["code"] = 500
                    err["error"] = "Exception : " + e.message
                    importedData["body"] = err

                }
            }
            return 0
        }
    }
}