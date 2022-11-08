<#assign renderParam = renderParam />
<#assign render = render />
<#assign html = html />
<#assign tmTotal = tmTotal />
<#assign importDatas = importDatas />
<#assign tmImportDatas = 0 />


<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>nazca Render Debug</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="/script/jquery.json-editor.min.js"></script>
    <script type="text/javascript">
        let renderParam = new Map();
        <#list renderParam as p>
        renderParam.set("${p.key}", "${p.value}");
        </#list>

        $(document).ready(function(){
            <#if importDatas?has_content>
            <#list importDatas as importData>
                <#assign tmImportDatas += importData.time />
            </#list>
            </#if>

            initParam("render");

            $("#formHtml").submit();
        });

        function reload(){
            let url = document.location.href.split("?");
            location.href = url[0] +"?"+ getParam();
        }

        function initParam(type){
            let requestParam;
            requestParam = renderParam;

            let html = "";
            let idx = 0;
            let add = false;
            let limit = Math.ceil(requestParam.size/5) * 5;
            requestParam.forEach(function(v, k, m){

                if(idx % 5 === 0) {
                    html += `<div class="row`;
                    if(idx > 0) {
                        html += ` mt-2 `;
                    }
                    html += `">`;
                }
                html += getUpdateHtml(type, k, v);
                if(idx === requestParam.size-1){
                    if(idx === limit-1){
                        add = true;
                    }
                    else{
                        for(idx=idx+1 ; idx<limit ; idx++){
                            if(idx === limit-1){
                                html += getCreateHtml(type);
                            }
                            else{
                                html += `<div class="col"></div>`;
                            }
                        }
                    }
                }
                if(idx % 5 === 4){
                    html += `</div>`;
                    if(add){
                        html += `
                            <div class="row mt-2">
                                <div class="col"></div><div class="col"></div><div class="col"></div><div class="col"></div>
                                `+getCreateHtml(type)+`
                            </div>
                        `;
                    }
                }
                idx++;
            });

            if(requestParam.size === 0){
                html += `
                    <div class="row">
                        <div class="col"></div><div class="col"></div><div class="col"></div><div class="col"></div>
                        `+getCreateHtml(type)+`
                    </div>
                `;
            }
            $("#render-param").html(html);
            updateKeyup(type);
        }

        function getUpdateHtml(type, k, v){
            return `
            <div class="col">
                <div class="input-group upd-group">
                    <span class="input-group-text" style="font-size: 12px; height: 23px;">`+k+`</span>
                    <input class="upd-param`+type+` form-control" type="text" data-key="`+k+`" value="`+v+`" style="font-size: 12px; height: 23px;" />
                    <button class="badge bg-danger text-wrap" style="border: none" onclick="javascript:delParam('`+type+`', '`+k+`')">-</button>
                </div>
            </div>
            `;
        }

        function getCreateHtml(type){
            return `
            <div class="col">
                <div class="input-group">
                    <input id="add-key`+type+`" class="cre-param`+type+` form-control input-group-text" placeholder="key" type="text" style="font-size: 12px; height: 23px;" />
                    <input id="add-val`+type+`" class="cre-param`+type+` form-control" placeholder="value" type="text" style="font-size: 12px; height: 23px;" />
                    <button class="badge bg-primary text-wrap" style="border: none" onclick="javascript:addParam('`+type+`')">+</button>
                </div>
            </div>
            `;
        }

        function delParam(type, key){
            renderParam.delete(key);
            initParam(type);
        }

        function addParam(type){
            let key = $("#add-key"+type).val();
            let val = $("#add-val"+type).val()
            if(!key || !val){
                alert("추가 파라미터 데이터가 비어있습니다.");
            }
            else{
                renderParam.set(key, val);
                initParam(type);
            }
        }

        function updateKeyup(type){
            $(".upd-param"+type).unbind().on("keyup", function(key){
                if(key.keyCode === 13){
                    reload();
                }
            }).on("focusout", function(){
                renderParam.set($(this).data("key"), $(this).val());
            });
            $(".cre-param"+type).unbind().on("keyup", function(key){
                if(key.keyCode === 13){
                    addParam(type);
                    $("#add-key"+type).focus();
                }
            });
        }

        function getParam(){
            let param = "";
            $(".upd-group").each(function(){
                let key = $(this).children(".form-control").data("key");
                let val = $(this).children(".form-control").val();
                if("" !== param) param+="&"
                param += key+"="+val;
            });
            return param;
        }
    </script>
</head>
<body class="bg-light" data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="90">

<nav class="navbar navbar-expand-sm navbar-dark bg-dark fixed-top" style="background-color: #2F4F4F;">
    <img class="m-1 mx-2" src="/assets/nazca.jpeg" alt="" width="38" height="38">
    <h1 class="h5 mb-0 text-white" style="width: 300px">nazca Render Debug <i class="bi bi-bug"></i></h1>

    <div class="container-fluid">
        <ul class="navbar-nav" style="font-size: 12px">
            <li class="nav-item">
                <a class="nav-link" href="#spy1">요청 정보</a>
            </li>

            <#if importDatas?has_content>
                <li class="nav-item">
                    <a class="nav-link" href="#spy3">Import Data</a>
                </li>
            </#if>
            <li class="nav-item">
                <a class="nav-link" href="#spy4">Render Page</a>
            </li>
        </ul>
        <div class="badge bg-success text-wrap mx-1 align-right"><i class="bi bi-stopwatch"></i> ${tmTotal} ms</div>
    </div>
</nav>

<main class="container">

    <div id="spy1" class="p-3 bg-body rounded shadow-lg container-fluid" style="margin-top: 70px;">
        <h6 class="border-bottom py-2 mb-0">
            <div class="container m-0 p-0">
                <div class="row m-0 p-0">
                    <div class="col m-0 p-0">
                        <i class="bi bi-megaphone"></i> 요청 정보
                        <button type="button" class="btn btn-dark btn-sm mx-2" style="font-size: 12px;" onclick="javascript:reload()">
                            <i class="bi bi-bootstrap-reboot"></i> 재요청
                        </button>
                    </div>
                </div>
            </div>
        </h6>

        <div class="mt-2 p-1 bg-body rounded shadow container-fluid">
            <h6 class="border-bottom py-2 mb-0" style="font-size: 12px">
                <div class="container m-0 p-0">
                    <div class="row m-0 p-0">
                        <div class="col m-0 p-0">
                            <span class="mx-1">Render Parameter</span>
                        </div>
                    </div>
                </div>
            </h6>
            <div class="bg-body rounded shadow mt-2 p-2">
                <div id="render-param" class="container-fluid m-0 p-0">
                </div>
            </div>
        </div>
    </div>

    <#if importDatas?has_content>
        <div id="spy3" class="my-3 p-3 bg-body rounded shadow-lg container-fluid">
            <h6 class="border-bottom py-2 mb-0">
                <div class="container m-0 p-0">
                    <div class="row m-0 p-0">
                        <div class="col m-0 p-0">
                            <i class="bi bi-cloud-plus"></i> Import Data
                        </div>
                        <div class="col m-0 p-0 text-end"><span class="badge bg-success text-wrap mx-1 align-right"><i class="bi bi-stopwatch"></i> ${tmImportDatas} ms</span></div>
                    </div>
                </div>
            </h6>
            <#list importDatas as importData>
                <div class="bg-body rounded shadow mt-2 p-2">
                    <div class="container m-0 p-0">
                        <div class="row">
                            <div class="col">
                                <span class="badge bg-success text-wrap mx-1 align-right" style="font-size: 10px;"><i class="bi bi-stopwatch"></i> ${importData.time} ms</span>
                                <a class="link-primary" style="font-size: 11px;" href="${importData.path}" target="_blank">${importData.path}</a>
                            </div>
                        </div>
                    </div>
                </div>
            </#list>
        </div>
    </#if>

    <div id="spy4" class="my-3 p-3 bg-body rounded shadow-lg container-fluid">
        <h6 class="border-bottom py-2 mb-0">
            <div class="container m-0 p-0">
                <div class="row">
                    <div class="col">
                        <i class="bi bi-file-earmark-image"></i> Render Page
                    </div>
                </div>
            </div>
        </h6>
        <div class="bg-body rounded shadow mt-2 p-2">
            <div class="container m-0 p-0">
                <div class="row">
                    ${html}
                </div>
            </div>
        </div>
    </div>
</main>
</body>
</html>
