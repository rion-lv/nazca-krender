<#assign TEMPLATE_UTILITY = templateUtils/>
<#assign PARAMETERS = parameters/>
<#assign SAS_URL_PREFIX = sasUrlPrefix/>
<#assign AUTO_COMPLETE_URL_PREFIX = autoCompleteUrlPrefix/>

<#if PARAMETERS?? && PARAMETERS["key"]??>
    <#assign KEY = PARAMETERS["key"]/>
</#if>
<#if PARAMETERS?? && PARAMETERS["collectionId"]??>
    <#assign COLLECTION_ID = PARAMETERS["collectionId"]/>
</#if>
<#if PARAMETERS?? && PARAMETERS["q"]??>
    <#assign Q = PARAMETERS["q"]/>
</#if>
<#if PARAMETERS?? && PARAMETERS["f1"]??>
    <#assign F1 = PARAMETERS["f1"]/>
</#if>
<#if PARAMETERS?? && PARAMETERS["f2"]??>
    <#assign F2 = PARAMETERS["f2"]/>
</#if>
<#if PARAMETERS?? && PARAMETERS["f3"]??>
    <#assign F3 = PARAMETERS["f3"]/>
</#if>
<#if PARAMETERS?? && PARAMETERS["f4"]??>
    <#assign F4 = PARAMETERS["f4"]/>
</#if>
<#if PARAMETERS?? && PARAMETERS["f5"]??>
    <#assign F5 = PARAMETERS["f5"]/>
</#if>
<#if PARAMETERS?? && PARAMETERS["f6"]??>
    <#assign F6 = PARAMETERS["f6"]/>
</#if>
<#if PARAMETERS?? && PARAMETERS["f7"]??>
    <#assign F7 = PARAMETERS["f7"]/>
</#if>
<#if PARAMETERS?? && PARAMETERS["f8"]??>
    <#assign F8 = PARAMETERS["f8"]/>
</#if>
<#if PARAMETERS?? && PARAMETERS["f9"]??>
    <#assign F9 = PARAMETERS["f9"]/>
</#if>
<#if PARAMETERS?? && PARAMETERS["f10"]??>
    <#assign F10 = PARAMETERS["f10"]/>
</#if>
<#if PARAMETERS?? && PARAMETERS["f11"]??>
    <#assign F11 = PARAMETERS["f11"]/>
</#if>
<#if PARAMETERS?? && PARAMETERS["f12"]??>
    <#assign F12 = PARAMETERS["f12"]/>
</#if>
<#if PARAMETERS?? && PARAMETERS["f13"]??>
    <#assign F13 = PARAMETERS["f13"]/>
</#if>
<#if PARAMETERS?? && PARAMETERS["f14"]??>
    <#assign F14 = PARAMETERS["f14"]/>
</#if>
<#if PARAMETERS?? && PARAMETERS["f15"]??>
    <#assign F15 = PARAMETERS["f15"]/>
</#if>

<#if PARAMETERS?? && PARAMETERS["u1"]??>
    <#assign U1 = PARAMETERS["u1"]/>
</#if>
<#if PARAMETERS?? && PARAMETERS["u2"]??>
    <#assign U2 = PARAMETERS["u2"]/>
</#if>
<#if PARAMETERS?? && PARAMETERS["u3"]??>
    <#assign U3 = PARAMETERS["u3"]/>
</#if>
<#if PARAMETERS?? && PARAMETERS["u4"]??>
    <#assign U4 = PARAMETERS["u4"]/>
</#if>
<#if PARAMETERS?? && PARAMETERS["u5"]??>
    <#assign U5 = PARAMETERS["u5"]/>
</#if>
<#if PARAMETERS?? && PARAMETERS["u6"]??>
    <#assign U6 = PARAMETERS["u6"]/>
</#if>
<#if PARAMETERS?? && PARAMETERS["u7"]??>
    <#assign U7 = PARAMETERS["u7"]/>
</#if>
<#if PARAMETERS?? && PARAMETERS["u8"]??>
    <#assign U8 = PARAMETERS["u8"]/>
</#if>
<#if PARAMETERS?? && PARAMETERS["u9"]??>
    <#assign U9 = PARAMETERS["u9"]/>
</#if>
<#if PARAMETERS?? && PARAMETERS["u10"]??>
    <#assign U9 = PARAMETERS["u10"]/>
</#if>
<#if PARAMETERS?? && PARAMETERS["u11"]??>
    <#assign U9 = PARAMETERS["u11"]/>
</#if>
<#if PARAMETERS?? && PARAMETERS["u12"]??>
    <#assign U9 = PARAMETERS["u12"]/>
</#if>
<#if PARAMETERS?? && PARAMETERS["u13"]??>
    <#assign U9 = PARAMETERS["u13"]/>
</#if>
<#if PARAMETERS?? && PARAMETERS["u14"]??>
    <#assign U9 = PARAMETERS["u14"]/>
</#if>
<#if PARAMETERS?? && PARAMETERS["u15"]??>
    <#assign U9 = PARAMETERS["u15"]/>
</#if>

<#if PARAMETERS?? && PARAMETERS["skip"]??>
    <#assign SKIP = PARAMETERS["skip"]/>
</#if>
<#if PARAMETERS?? && PARAMETERS["limit"]??>
    <#assign LIMIT = PARAMETERS["limit"]/>
</#if>

<#if PARAMETERS?? && PARAMETERS["page"]??>
    <#assign PAGE = PARAMETERS["page"]/>
</#if>
<#if PARAMETERS?? && PARAMETERS["size"]??>
    <#assign SIZE = PARAMETERS["size"]/>
</#if>

<#if PARAMETERS?? && PARAMETERS["sortOption"]??>
    <#assign SORTOPTION = PARAMETERS["sortOption"]/>
</#if>