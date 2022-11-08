<#assign f11 = F11!""/>
<#assign sasDataUrl = SAS_URL_PREFIX+"?volume=general1&collectionId=3&type=keyword&q=&f11="+f11/>
<#assign sasResult = TEMPLATE_UTILITY.importData(sasDataUrl,"json",300)/>
<#assign first = sasResult.itemList?first!{}/>
<#if first?? >
    <#assign item = first.service!{}/>
<#else>
    <#assign item = {}/>
</#if>
<#assign result = {
    "total" : sasResult.total,
    "item" : item,
    "end" : sasResult.end
}/>
