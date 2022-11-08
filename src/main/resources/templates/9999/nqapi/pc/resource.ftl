<#macro printHeader>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
    <script>
        function copy(id){
            var element = document.getElementById(id);
            var textArea = document.createElement("textarea");
            document.body.appendChild(textArea);
            textArea.value = element.value;
            textArea.select();
            document.execCommand("Copy");
            textArea.remove();
        };
        $.datepicker.setDefaults({
            dateFormat: 'yymmdd',
            prevText: '이전 달',
            nextText: '다음 달',
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            dayNames: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            showMonthAfterYear: true,
            yearSuffix: '년'
        });
        $(function() {
            $("#datepicker").datepicker();
        });
        function isEmpty(value) {
            return typeof value == 'string' && !value.trim() || typeof value == 'undefined' || value === null;
        }
    </script>
    <style>
        body {
            font-family:'Malgun Gothic';
            font-size:11pt;
            margin-left: auto;
            margin-right: auto;
            width: 8em
        }
        li {
            font-family:'Malgun Gothic';
            font-size:11pt;
        }
        .box_img_wrap{
            background-color : #ddd;
            background-position : center;
            background-repeat : no-repeat;
            background-size : cover;
            background-size : contain;
        }
    </style>

</#macro>

<#macro printMapJs>
    <script>
        Map = function(){
            this.map = new Object();
        };
        Map.prototype = {
            put : function(key, value){
                this.map[key] = value;
            },
            get : function(key){
                return this.map[key];
            },
            containsKey : function(key){
                return key in this.map;
            },
            containsValue : function(value){
                for(var prop in this.map){
                    if(this.map[prop] == value) return true;
                }
                return false;
            },
            isEmpty : function(key){
                return (this.size() == 0);
            },
            clear : function(){
                for(var prop in this.map){
                    delete this.map[prop];
                }
            },
            remove : function(key){
                delete this.map[key];
            },
            keys : function(){
                var keys = new Array();
                for(var prop in this.map){
                    keys.push(prop);
                }
                return keys;
            },
            values : function(){
                var values = new Array();
                for(var prop in this.map){
                    values.push(this.map[prop]);
                }
                return values;
            },
            size : function(){
                var count = 0;
                for (var prop in this.map) {
                    count++;
                }
                return count;
            }
        };
    </script>
</#macro>