<#include "../../../common/common_model.ftl"/>
<#include "../../../common/common_control.ftl"/>

<#if KEY=="list">
    <#include "3_model_list.ftl"/>
    <@printJsonElement result true/>
<#elseif KEY=="filter">
    <#include "3_model_filter.ftl"/>
    <@printJsonElement result true/>

<#elseif KEY=="detail">
    <#include "3_model_detail.ftl"/>
    <@printJsonElement result true/>

</#if>