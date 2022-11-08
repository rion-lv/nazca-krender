<#include "resource.ftl"/>
<#include "../../../common/common_model.ftl"/>
<#include "../../../common/common_control.ftl"/>
<#if KEY?? && KEY=="api">
    <#include "9999_api.ftl"/>
<#else>
    <#include "9999_view.ftl"/>
</#if>