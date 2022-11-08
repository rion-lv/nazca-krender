<#include "resource.ftl"/>
<#include "../../../common/common_model.ftl"/>
<#include "../../../common/common_control.ftl"/>
<html>
    <header>
        <@printHeader/>
        <style>
            em {
                font-family:'Malgun Gothic';
                font-style: normal;
                font-size:11pt;
                font-weight: bold;
                color : orange;
            }
        </style>
        <script>
            let before;
            function change(){
                var value = document.form.input.value;
                if(before===value){
                    return;
                }
                before = value;
                $.ajax({
                    url: "/nazca/render?collectionId=9999&platform=pc&render=nqapi&key=api&q="+value+"&u1=${U1}",
                    type: "GET",
                    contentType: "application/json",
                    dataType: "json",
                    data: null,
                    success: function(data){
                        const list = data.list;
                        if(list.length==0){
                            //결과 없음
                            document.getElementById("result").innerHTML = "";
                        }else{
                            let div = document.getElementById("result");
                            let autoComplete = "";
                            for(let i=0;i<list.length;i++){
                                const meta = list[i].meta;
                                const tag = meta.tag;
                                const child = "<p>"+tag+"</p>";
                                autoComplete = autoComplete+child;
                            }
                            div.innerHTML = autoComplete;
                        }
                    },
                    error: function (request, status, error){
                        console.error(error.responseText);
                    }
                });
            }
        </script>
    </header>
    <body>
        <form name="form" onsubmit="return false">
            <div>자동완성 데모 <input type="text" name="input" onkeyup="javascript:change()"/></div>
        </form>
        <div id="result">
        </div>
    </body>
</html>




