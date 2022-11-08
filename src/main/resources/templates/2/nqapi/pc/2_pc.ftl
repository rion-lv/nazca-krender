<#include "../../../common/common_model.ftl"/>
<#include "../../../common/common_control.ftl"/>
<#include "2_control.ftl"/>

<#--sas 호출-->
<#assign sasUrl = SAS_URL_PREFIX+"?volume=general1&collectionId=2&skip=0&limit=10&type=keyword"/>
<#assign sasResult = TEMPLATE_UTILITY.importData(sasUrl,"json",300)/>

<#include "../../../common/common_sas.ftl"/>
<#if U1?? && U1=="json">
    <@printJsonElement sasResult true/>
<#else>
    <html>
    <@printHead/>
    <body>
        <@printPnation/>
    </body>
    </html>
</#if>



