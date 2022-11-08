<#assign sasDataUrl = SAS_URL_PREFIX+"?volume=general1&collectionId=3&type=keyword"/>
<#if Q?? && Q?has_content>
    <#assign sasDataUrl = sasDataUrl+"&q="+Q/>
<#else>
    <#assign sasDataUrl = sasDataUrl+"&q="/>
</#if>

<#if F1?? && F1?has_content>
    <#assign sasDataUrl = sasDataUrl+"&f1="+F1/>
</#if>
<#if F2?? && F2?has_content>
    <#assign sasDataUrl = sasDataUrl+"&f2="+F2/>
</#if>
<#if F3?? && F3?has_content>
    <#assign sasDataUrl = sasDataUrl+"&f3="+F3/>
</#if>
<#if F4?? && F4?has_content>
    <#assign sasDataUrl = sasDataUrl+"&f4="+F4/>
</#if>
<#if F5?? && F5?has_content>
    <#assign sasDataUrl = sasDataUrl+"&f5="+F5/>
</#if>
<#if F6?? && F6?has_content>
    <#assign sasDataUrl = sasDataUrl+"&f6="+F6/>
</#if>
<#if F7?? && F7?has_content>
    <#assign sasDataUrl = sasDataUrl+"&f7="+F7/>
</#if>
<#if F8?? && F8?has_content>
    <#assign sasDataUrl = sasDataUrl+"&f8="+F8/>
</#if>
<#if F9?? && F9?has_content>
    <#assign sasDataUrl = sasDataUrl+"&f9="+F9/>
</#if>
<#if F10?? && F10?has_content>
    <#assign sasDataUrl = sasDataUrl+"&f10="+F10/>
</#if>
<#if F11?? && F11?has_content>
    <#assign sasDataUrl = sasDataUrl+"&f11="+F11/>
</#if>
<#if skip?? && skip?has_content>
    <#assign sasDataUrl = sasDataUrl+"&skip="+skip/>
</#if>
<#if limit?? && limit?has_content>
    <#assign sasDataUrl = sasDataUrl+"&limit="+limit/>
</#if>

<#if PAGE?? && PAGE?has_content>
    <#assign sasDataUrl = sasDataUrl+"&page="+PAGE/>
</#if>
<#if SIZE?? && SIZE?has_content>
    <#assign sasDataUrl = sasDataUrl+"&size="+SIZE/>
</#if>

<#if SORTOPTION?? && SORTOPTION?has_content>
    <#assign sasDataUrl = sasDataUrl+"&sortOption="+SORTOPTION/>
<#else>
    <#assign sasDataUrl = sasDataUrl+"&sortOption=s1.asc"/>
</#if>

<#assign sasResult = TEMPLATE_UTILITY.importData(sasDataUrl,"json",300)/>

<#assign itemList = []/>
<#list sasResult.itemList as item>
    <#assign itemList = itemList + [item.service]/>
</#list>

<#assign result = {
    "total" : sasResult.total,
    "itemList" : itemList,
    "end" : sasResult.end
}/>