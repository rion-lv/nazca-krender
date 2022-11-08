<#macro printNoResult collectionId>
    <!-- no result : ${collectionId}-->
</#macro>


<#------------------------------------------------
	변수 계층구조를 xml형식으로 출력
-------------------------------------------------->
<#macro printXmlElement xmlEl caseSensitive=true parent="">
    <#compress>
        <#if xmlEl?is_string>
            <![CDATA[${xmlEl}]]>
        <#elseif xmlEl?is_number>
            <![CDATA[${xmlEl?c}]]>
        <#elseif xmlEl?is_boolean>
            <![CDATA[${xmlEl?string("true","false")}]]>
        <#elseif xmlEl?is_hash>
            <#local keys = xmlEl?keys />
            <#list keys as key>
                <#local strKey = caseSensitive?string(key, key?lower_case)>
                <${strKey}><@printXmlElement xmlEl[key]!"" caseSensitive strKey/></${strKey}>
            </#list>
        <#elseif xmlEl?is_sequence>
        <#-- xml에서는 sequence를 그리기 위해 엘리먼트 명이 필요하므로 {부모엘리먼트_subitem}으로 이름한다. -->
            <#list xmlEl as xmlItem>
                <${parent}_subitem><@printXmlElement xmlItem caseSensitive/></${parent}_subitem>
            </#list>
        </#if>
    </#compress>
</#macro>

<#------------------------------------------------
	변수 계층구조를 json형식으로 출력
-------------------------------------------------->
<#macro printJsonElement jsonEl caseSensitive=true>
    <#compress>
        <#if jsonEl?is_string>
            "${jsonEl?json_string}"
        <#elseif jsonEl?is_number>
            ${jsonEl?c}
        <#elseif jsonEl?is_boolean>
            ${jsonEl?string("true","false")}
        <#elseif jsonEl?is_hash>
            {
            <#local count = 0/>
            <#local assignCount = 0/>

            <#local size = jsonEl?size/>
            <#list jsonEl as key,value>
                <#if value?? && !value?is_macro>
                   <#local assignCount++/>
                </#if>
            </#list>
            <#list jsonEl as key,value>
                <#local strKey = caseSensitive?string(key, key?lower_case)>
                <#if value?? && !value?is_macro>
                    "${strKey}":<@printJsonElement jsonEl[key]!"" caseSensitive/>
                    <#--<#if key_has_next>,</#if>-->
                    <#local count = count+1/>
                    <#if count<assignCount>,</#if>
                </#if>
            </#list>
            }
        <#elseif jsonEl?is_sequence>
            [
            <#list jsonEl as jsonItem>
                <@printJsonElement jsonItem caseSensitive/><#if jsonItem_has_next>,</#if>
            </#list>
            ]
        </#if>
    </#compress>
</#macro>