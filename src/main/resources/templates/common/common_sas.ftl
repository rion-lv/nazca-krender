
<#assign SAS_RESULT = sasResult/>

<#------------------------------------------------------------------------------
	SAS 데이터 관련 공통 변수 설정(첫번째 항목 및 ItemList의 alias)
-------------------------------------------------------------------------------->
<#if sasResult?? && sasResult.itemList?? && sasResult.itemList?is_sequence && sasResult.itemList?size gt 0>
    <#global FIRST_ITEM = sasResult.itemList?first />
    <#if FIRST_ITEM._sort?? && FIRST_ITEM._sort?size &gt;0>
        <#global FIRST_ITEM_SCORE = FIRST_ITEM._sort[0]/>
    </#if>

<#else>
    <#global FIRST_ITEM = {} />
</#if>
<#global ITEM_LIST = sasResult.itemList![] />


<#if sasResult?? && sasResult.searchOption?? && sasResult.searchOption.q??>
    <#assign TOTAL = sasResult.total/>
    <#assign Q = sasResult.searchOption.q/>
    <#assign RETRY_COUNT = sasResult.retryCount/>
<#else>
    <#if sasResult?? && sasResult.total??>
        <#assign TOTAL = sasResult.total/>
        <#assign RETRY_COUNT = sasResult.retryCount/>
    <#else>
        <#assign TOTAL = 0/>
        <#assign RETRY_COUNT = 0/>
    </#if>
</#if>

<#-- 파라미터 정보 -->
<#if searchParameterModel??>
    <#assign PARAM = searchParameterModel/>
</#if>

