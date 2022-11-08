<#include "resource.ftl"/>
<#include "../../../common/common_model.ftl"/>
<#include "../../../common/common_control.ftl"/>

<#--sas 호출-->
<#assign autoCompleteUrl = AUTO_COMPLETE_URL_PREFIX+"?collectionId=${U1}&q=${Q}"/>
<#assign autoCompleteResult = TEMPLATE_UTILITY.importData(autoCompleteUrl,"json",300)/>
<@printJsonElement autoCompleteResult true/>
