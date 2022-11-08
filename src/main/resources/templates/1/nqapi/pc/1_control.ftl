<#macro printHead>
    <head>
        <meta charset="utf-8">
        <title>영화 컬렉션</title>
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

<#macro printMovies>
    <#if RETRY_COUNT gte 1>
        <@printNoResult 1/>
    <#else>
        <div style="background-color: lightgray;color:#4374D9;font-size:20pt"><b> 영화222 </b> (${TOTAL}건)</div>
        <#list ITEM_LIST as item>
            <#assign service = item.service/>
            <#assign movieActors = item.service.actors/>
            <#assign genres = item.service.genre/>
            <#assign cinemas = item.service.cinema/>

            <div >
                <div style="font-size: 18pt"><b>${service.movie_name}</b></div>
                <div>
                    <div style="display: inline-block">
                        <img src="${service.poster}" width="80%" onError="this.onerror=null;this.src='/search/nazca/images/noimage';"/>
                    </div>
                    <div>
                        <p>
                            <b>제작국가</b> : ${service.nation}
                            <b> 관객수</b> : ${service.view}명
                            <b> 평점</b> : ${service.score}
                            <b> 감독</b> : ${service.director}
                            <#if service.first_open_date??>
                                <b> 최초개봉일</b> : ${service.first_open_date}
                            </#if>
                        <p>
                        <p>
                            <b>장르 : </b>
                            <#list genres as genre>
                                ${genre.genre_name}
                                <#if genre?has_next>,</#if>
                            </#list>
                        </p>
                    </div>
                </div>
                <b>줄거리</b> : ${service.story}
                </p>
                <b>등장 인물</b> <br>
                <table style="width:100%;">
                    <tr>
                    <#list movieActors as movieActor>
                        <td>
                            <div>
                                <img src="${movieActor.actor_image}" onError="this.onerror=null;this.src='/search/nazca/images/noimage';"/>
                            </div>
                            <div>
                                ${movieActor.actor_name}
                                (${movieActor.actor_role})
                            </div>
                            <div>
                                <#if movieActor.company??>
                                    ${movieActor.company}
                                </#if>
                            </div>
                        </td>
                    </#list>
                    </tr>
                </table>
                <br/>
                <div>
                    <div>
                        <b>상영관</b>
                    </div>
                    <#list cinemas as cinema>
                    <div style="border:solid lightgray 1px;display:block;margin-bottom:4pt;display:inline-block">
                        <div style="margin:4pt">* 영화관 : ${cinema.name}</div>
                        <div style="margin:4pt">* 개봉일 : ${cinema.open_date}</div>
                        <div style="margin:4pt">* 링크 : <a href="${cinema.url}" target="_black">바로가기</a></div>
                    </div>
                    </#list>
                </div>
            </div>
        </#list>
    </#if>
    <#if testResult?? && testResult.itemList??>
        <table>
            <#list testResult.itemList as item>

                <#if item?? && item.service.movie_name??>
                    <tr>
                        <td>
                            IMPORT DATA 정보 : ${item.service.movie_name}<br>
                        </td>
                    </tr>
                </#if>
            </#list>
        </table>
    </#if>
</#macro>