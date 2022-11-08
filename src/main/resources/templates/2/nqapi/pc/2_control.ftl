<#macro printHead>
    <head>
        <meta charset="utf-8">
        <title>P-NATION</title>
        <style>
            div {
                font-family:'Malgun Gothic';
                font-size: 14px;
            }
            td {
                font-family:'Malgun Gothic';
                font-size: 14px;
            }
            body {
                font-family:'Malgun Gothic';
                font-size:14pt;
            }
            li {
                font-family:'Malgun Gothic';
                font-size:14pt;
            }

        </style>
    </head>
</#macro>

<#macro printPnation>
    <#if RETRY_COUNT gte 1>
        <@printNoResult 1/>
    <#else>
        <div style="background-color: lightgray;color:#4374D9;font-size:20pt"><b> P-NATION </b> (${TOTAL}건)</div>
        <#list ITEM_LIST as item>
            <#assign service = item.service/>

            <div >
                <div style="font-size: 18pt"><b>${service.name}</b></div>
                <div>
                    <div style="display: inline-block">
                        <img src="${service.image_url}" width="80%" onError="this.onerror=null;this.src='/search/nazca/images/noimage';"/>
                    </div>
                    <div>
                        <p>
                            <b>번호</b> : ${service.number}
                            <b>이름</b> : ${service.name}
                            <b>크리에이터</b> : ${service.creator}
                            <b>설명</b> : ${service.description}
                            <b>민팅수</b> : ${service.mint_count}
                        <p>
                    </div>
                </div>
            </div>
        </#list>
    </#if>
</#macro>