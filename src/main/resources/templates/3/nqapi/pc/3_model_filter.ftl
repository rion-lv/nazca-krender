<#assign sasDataUrl = SAS_URL_PREFIX+"?volume=general1&collectionId=3&type=keyword"/>
<#if Q?? && Q?has_content>
    <#assign sasDataUrl = sasDataUrl+"&q="+Q/>
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

<#assign hasCountUrl = sasDataUrl+"&groupBy=g1 g2 g3 g4 g5 g6 g7 g8 g9 g10"/>
<#assign hasResult = TEMPLATE_UTILITY.importData(hasCountUrl,"json",300)/>
<#assign has1 = hasResult.groupBy.g1!{}/>   <#--background_mood-->
<#assign has2 = hasResult.groupBy.g2!{}/>   <#--clothes-->
<#assign has3 = hasResult.groupBy.g3!{}/>   <#--face-->
<#assign has4 = hasResult.groupBy.g4!{}/>   <#--head_wear-->
<#assign has5 = hasResult.groupBy.g5!{}/>   <#--theme-->
<#assign has6 = hasResult.groupBy.g6!{}/>   <#--mic-->
<#assign has7 = hasResult.groupBy.g7!{}/>   <#--pin_wappen-->
<#assign has8 = hasResult.groupBy.g8!{}/>   <#--neck_accessory-->
<#assign has9 = hasResult.groupBy.g9!{}/>   <#--eye_wear-->
<#assign has10 = hasResult.groupBy.g10!{}/> <#--tone on tone-->

<#assign allCountUrl = SAS_URL_PREFIX+"?volume=general1&collectionId=3&type=keyword&groupBy=g1 g2 g3 g4 g5 g6 g7 g8 g9 g10"/>
<#if hasCountUrl!=allCountUrl>  <#-- 전체 랜더링 이후 특정 조건으로 검색을하면 좌측에 속성 카운트를 변경해 주어야 하는데 속성이 없는 경우 키도 응답을 못해서 {키:0} 의 형태로 서빙해 주기 위해서 -->
    <#assign allResult = TEMPLATE_UTILITY.importData(allCountUrl,"json",300)/>
    <#assign all1 = allResult.groupBy.g1!{}/>   <#--background_mood-->
    <#assign all2 = allResult.groupBy.g2!{}/>   <#--clothes-->
    <#assign all3 = allResult.groupBy.g3!{}/>   <#--face-->
    <#assign all4 = allResult.groupBy.g4!{}/>   <#--head_wear-->
    <#assign all5 = allResult.groupBy.g5!{}/>   <#--theme-->
    <#assign all6 = allResult.groupBy.g6!{}/>   <#--mic-->
    <#assign all7 = allResult.groupBy.g7!{}/>   <#--pin_wappen-->
    <#assign all8 = allResult.groupBy.g8!{}/>   <#--neck_accessory-->
    <#assign all9 = allResult.groupBy.g9!{}/>   <#--eye_wear-->
    <#assign all10 = allResult.groupBy.g10!{}/> <#--tone on tone-->

    <#assign merge1 = merge(all1,has1)/>
    <#assign merge2 = merge(all2,has2)/>
    <#assign merge3 = merge(all3,has3)/>
    <#assign merge4 = merge(all4,has4)/>
    <#assign merge5 = merge(all5,has5)/>
    <#assign merge6 = merge(all6,has6)/>
    <#assign merge7 = merge(all7,has7)/>
    <#assign merge8 = merge(all8,has8)/>
    <#assign merge9 = merge(all9,has9)/>
    <#assign merge10 = merge(all10,has10)/>

    <#assign filterCount = {
        "background mood": merge1,
        "clothes" : merge2,
        "face" : merge3,
        "head wear" : merge4,
        "theme" : merge5,
        "mic" : merge6,
        "pin wappen": merge7,
        "neck accessory" : merge8,
        "eye wear" : merge9,
        "tone on tone" : merge10
    }/>
<#else>
    <#-- 검색 조건 없이 전체 데이터에 대해서 속성 카운트-->
    <#assign filterCount = {
        "background mood": has1,
        "clothes" : has2,
        "face" : has3,
        "head wear" : has4,
        "theme" : has5,
        "mic" : has6,
        "pin wappen": has7,
        "neck accessory" : has8,
        "eye wear" : has9,
        "tone on tone" : has10
    }/>
</#if>

<#assign result = {
    "total" : hasResult.total,
    "filterCount" : filterCount
}/>

<#function merge allItems, hasItems>
    <#assign temp = []/>

    <#-- face => smile=10, angry=5 형태의 맵-->
    <#local map = {}/>
    <#list hasItems as hasItem>
        <#local map = map + {hasItem.value:hasItem.count}/>
    </#list>

    <#list allItems as allItem>
        <#local count = 0/>
        <#if map[allItem.value]??>
            <#local count = map[allItem.value]/>
        </#if>
        <#-- all 에서 맵에 조인되는 키가 있으면 맵에 있는 카운트를 사용하고 매핑되는 키가 없으면 0 으로 세팅-->
        <#local member = {
            "value" : allItem.value,
            "count" : count
        }/>
        <#assign temp = temp+[member]/>
    </#list>
    <#return temp/>
</#function>