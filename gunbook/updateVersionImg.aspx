<%@ Page Language="C#" AutoEventWireup="true" CodeFile="updateVersionImg.aspx.cs" Inherits="gunbook_addPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta charset="utf-8" />
    <title>Gun register book</title>
    <script src="../js.iviewer/test/jquery.js"></script>
    <script src="../js.iviewer/test/jqueryui.js"></script>
    <script src="../js.iviewer/test/jquery.mousewheel.min.js"></script>
    <script src="../js.iviewer/jquery.iviewer.js"></script>

    <meta name="description" content="Drag &amp; drop hierarchical list" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="../assets/css/bootstrap.css" />
    <link rel="stylesheet" href="../assets/css/font-awesome.css" />

    <!-- page specific plugin styles -->

    <!-- text fonts -->
    <link rel="stylesheet" href="../assets/css/ace-fonts.css" />

    <!-- ace styles -->
    <link rel="stylesheet" href="../assets/css/ace.css" class="ace-main-stylesheet" />

    <!--[if lte IE 9]>
		<link rel="stylesheet" href="../assets/css/ace-part2.css" class="ace-main-stylesheet" />
	<![endif]-->

    <!--[if lte IE 9]>
	  <link rel="stylesheet" href="../assets/css/ace-ie.css" />
	<![endif]-->

    <!-- inline styles related to this page -->

    <!-- ace settings handler -->
    <script src="../assets/js/ace-extra.js"></script>

    <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

    <!--[if lte IE 8]>
	<script src="../assets/js/html5shiv.js"></script>
	<script src="../assets/js/respond.js"></script>
	<![endif]-->
    <script src="../Scripts/angular.min.js"></script>

    <style>
        .checkstyle {
            cursor: pointer;
            height: 30px;
            min-width: 30px;
        }

        #myInput {
            /*background-image: url('../icon/searchicon.png');
            background-position: 10px 12px;
            background-repeat: no-repeat;*/
            width: 100%;
            font-size: 16px;
            padding: 5px 10px 5px 10px;
            border: 1px solid #ddd;
            margin-bottom: 12px;
        }

        #myUL {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }


            #myUL li a {
                border: 1px solid #ddd;
                margin-top: -1px; /* Prevent double borders */
                background-color: #f6f6f6;
                padding: 12px;
                text-decoration: none;
                font-size: 18px;
                color: black;
                display: block
            }

                #myUL li a.header {
                    background-color: #e2e2e2;
                    cursor: default;
                }

                #myUL li a:hover:not(.header) {
                    background-color: #eee;
                }
    </style>

    <style>
        .modal-dialog-fullscreen {
            height: 100%;
            margin-top: 0px;
            margin-bottom: 0px;
            padding: 0;
        }

        .modal-content-fullscreen {
            height: 100%;
            min-height: 100%;
            border-radius: 0;
        }

        .modal-body {
            max-height: calc(100vh - 100px);
            overflow-y: auto;
        }
    </style>

    <script type="text/javascript">
        function deleteConfirm(Gunid) {
            var result = confirm('Do you want to delete ' + Gunid + ' ?');
            if (result) {
                return true;
            }
            else {
                return false;
            }
        }
    </script>

    <link href="../js.iviewer/jquery.iviewer.css" rel="stylesheet" />
    <style>
        .viewer {
            width: 100%;
            height: 100%;
            /*border: 1px solid black;*/
            position: relative;
        }

        .wrapper {
            overflow: hidden;
        }
    </style>
</head>
<body style="background-color: white"> 
    <div id="mainApp" ng-app="myApp" ng-controller="StartApp" style="height: 100%">
        <div class="row">               
             <div class="widget-box transparent" id="widget-box-2">
                 <div class="widget-header widget-header-small">
                     &nbsp;&nbsp;&nbsp;&nbsp;
                            <h4 class="widget-title blue smaller">
                                <i class="ace-icon fa fa-edit blue"></i>
                                {{titleHead}} 
                            </h4>
                            <span style="color: black; font-size: small">&nbsp;&nbsp;&nbsp;&nbsp;
                   
                                <label class="control-label no-padding-right text-right" for="bookno">เลขที่หนังสือ : </label>
                                <label id="bookno"></label>
                                &nbsp;&nbsp;&nbsp;
                                <label class="control-label no-padding-right text-right" for="pageno">เลขที่หน้า : </label>
                                <label id="pageno"></label>
                                &nbsp;&nbsp;&nbsp;
                                <label class="control-label no-padding-right text-right" for="pagever">เวอร์ชั่นล่าสุด : </label>
                                <label id="pagever"></label>
                                <%--<span class="glyphicon glyphicon-edit" data-toggle="modal" data-target="#myModalAddImg" style="color: #0088cc; font-size: 13px;"></span>--%>
                            </span>
                            <div class="widget-toolbar">


                                <%--    <a ng-show="StatusPage != 'Create'" class="btn btn-primary" ng-click="fnSave('2')" style="width: 100px;">
                                    <i class="ace-icon fa fa-check"></i>
                                    บันทึก
                                </a>--%>
                              

                             <%--   onclick="fnUpdateVersion()"--%>
                                <a class="btn btn-primary"   ng-click="fnUpdateVersion()" style="width: 100px;">
                                    <i class="ace-icon fa fa-save"></i>
                                    บันทึก
                                </a>
                                <a class="btn btn-danger" onclick="fnClose()" style="width: 100px;">
                                    <i class="ace-icon fa fa-remove"></i>
                                    ยกเลิก
                                </a>

                            </div>
                        </div>
                 <div class="widget-body">
                            <div class="row" style="margin: 5px 15px 0px 0px">
                                <div class="col-sm-12 text-center" style="padding: 0px;">

                                    <label class="control-label no-padding-right text-right" >เวอร์ชัน : </label>
                               <select  id="imgVersion"  class="btn btn-primary btn-white dropdown-toggle" style="width: 110px;">
                             
                               </select>

                               <%--      <input class="select" type="text" />--%>
                                    <a class="btn btn-success btn-sm" onclick="fnOpenImage()">
                                         <%--<i class="ace-icon fa fa-plus bigger-110">--%></i> โหลดภาพ
                                    </a>
                    
                                    
                                     <input id="fileInput" type="file" style="display: none;" />
                                    <input class="btn btn-purple  btn-sm" type="button" value="เลือกรูปภาพเวอร์ชันใหม่" onclick="document.getElementById('fileInput').click();" />
 

                                    <a class="btn btn-danger btn-sm" onclick="fnCloseImg()">
                                      <%-- <i class="ace-icon fa fa-picture-o bigger-110">--%></i> ปิด
                                    </a>
 
                      
                                </div>
                            </div>
                        </div>
             </div>
        </div>

        

        <div class="wrapper" style="height: calc(100vh - 80px);">
            <div id="viewer2" class="viewer" style="width: 100%; background-color: #d2d2d2;"></div>
        </div>
      
 
    </div>
     <div id="loading" style="display: none; margin-top: 50px">
            <center>
                <h1 class="bigger"><i class="ace-icon fa fa-spinner fa-spin orange"></i></h1>
                <h3>                    
                    อยู่ระหว่างประมวลผลโปรดรอ...
                </h3>
            </center>
        </div>
    <!-- basic scripts -->

    <!--[if !IE]> -->
   
   
    <!-- <![endif]-->
    <!--[if IE]>
        <script src="../assets/js/jquery1x.js"></script>
        <![endif]-->
    <script type="text/javascript">
        if ('ontouchstart' in document.documentElement) document.write("<script src='../assets/js/jquery.mobile.custom.js'>" + "<" + "/script>");
    </script>
    

    <!-- the following scripts are used in demo only for onpage help and you don't need them -->
 
    <script src="../assets/js/bootbox.js"></script>


    <script>

        function showmessage(msg, fun, parameter) {
            $('#close').popover('hide');
            bootbox.dialog({
                message: "<span class='bigger-125'><i class='ace-icon fa fa-info-circle'></i>&nbsp;" + msg + "</span>",
                buttons:
                {
                    "click":
                    {
                        "label": "OK",
                        "className": "btn-sm btn-primary",
                        "callback": function () {
                            if (fun) { fun(parameter); }
                        }
                    }
                }
            });
        }
        function fnLoading() {
            document.getElementById("mainApp").style.display = "none";
            document.getElementById("loading").style.display = "";
        }
        function fnUnLoading() {
            document.getElementById("mainApp").style.display = "";
            document.getElementById("loading").style.display = "none";
        }
        function fnClose() {
            window.parent.closepopupfull();
        }

        function fnSetLog(Menu, FN_Name, Detail) {
            var data = $.param({
                Command: 'set_log',
                Menu: Menu,
                FN_Name: FN_Name,
                Detail: Detail
            });

            $http_gobal.post("../server/Server_Gunbook.aspx", data, config)
                .success(function (data, status, headers, config) {

                })
                .error(function (data, status, header, config) { });
        }
        //======================================================
        var app = angular.module('myApp', []);
        var config = { headers: { 'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;' } }
        app.controller('StartApp', StartApp);
        var $tmp_scope;
        var $tmp_http;

        app.filter('replaceAllstr', function () {
            return function (input) {
                input = String(input).replace('&amp;', '&');
                input = String(input).replace('&lt;', '<');
                input = String(input).replace('&gt;', '>');
                input = String(input).replace('&apos;', "'");
                input = String(input).replace('&quot;', '"');
                input = String(input).replace('&#39;', "'");
                return input;
            };
        });

        app.filter('replaceAllstrChar', function () {
            return function (item) {
                angular.forEach(item, function (input, key) {
                    input = String(input).replace('&', '&amp;');
                    input = String(input).replace('<', '&lt;');
                    input = String(input).replace('>', '&gt;');
                    input = String(input).replace("'", '&apos;');
                    input = String(input).replace('"', '&quot;');
                    input = String(input).replace("'", '&#39;');
                });
                return item;
            };
        });

        app.directive('onFinishRender', ['$timeout', '$parse', function ($timeout, $parse) {
            return {
                restrict: 'A',
                link: function (scope, element, attr) {
                    if (scope.$last === true) {
                        $timeout(function () {
                            scope.$emit('ngRepeatFinished');
                            if (!!attr.onFinishRender) {
                                $parse(attr.onFinishRender)(scope);
                            }
                        });
                    }
                }
            }
        }]);
        var tmp_ID;
        var img_base64;
        var img_base64new;
        var stateImg;
        var tmp_src_img;
        var tmp_img_base64;
        var BOOKNO = "";
        var PAGENO = "";
        var BOOKYEAR = "";
        var LASTVERSION = "";
        var NEWVERSION = "";
        var STATUS = "";
        var _lastVer = "";
        var Cstatus = "";


        function StartApp($scope, $http, $filter) {
            fnLoading();

            BOOKNO = getParamValue("BOOKNO");
            PAGENO = getParamValue("PAGENO"); 

            LASTVERSION = getParamValue("LASTVERSION");
            NEWVERSION = getParamValue("NEWVERSION");
            STATUS = getParamValue("STATUS");
            loadData($scope, $http);

            Cstatus = getParamValue("Cstatus");
            


            $tmp_scope = $scope;
            $tmp_http = $http;

            $scope.titleHead = "ระบบจัดการรูปภาพเอกสาร";

            $scope.fnUpdateVersion = function () {

 //               fnSetLog("หน้าต่างจัดการเอกสารเวอร์ชันใหม่", "SaveImageVersion", "บันทึกการสร้างเอกสารเวอร์ชันใหม่");
          //  function fnUpdateVersion() {
                if (stateImg !="true") {
                    alert("ยังไม่ได้เลือกรูปภาพเอกสารเวอร์ชันใหม่ กรุณาเลือกก่อนบันทึกข้อมูล");
                    return;
                }
                
             
 
                var index = document.getElementById("imgVersion").selectedIndex;
                var _NEWVERSION = document.getElementsByTagName("option")[index].value;
                fnLoading();
                //   console.log(img_base64new);
                var data = $.param({
                    Command: 'UpdateVersion',
                    bookno: BOOKNO,
                    pageno: PAGENO,
                    pageVer: _NEWVERSION,
                    imgBase64: img_base64New,
                    bookYear: BOOKYEAR
                });

                $tmp_http.post("../server/Server_Gunbook.aspx", data, config)
                    .success(function (data, status, headers, config) {
                      
                        if (data.output == 'OK') {
                            window.parent.refreshAllData();
                            fnCloseImg();
                            fnUnLoading();
                            return;
                        } else {
                            loadData($scope, $http);
                            fnCloseImg();
                            fnUnLoading();
                            alert(data.MSG);
                        }
                    })
                    .error(function (data, status, header, config) { });

              

           
            }

            $scope.fnWebConfig = function () {

                var data = $.param({
                    Command: 'SetWebConfig',
                    pathImgStore: "PathIMAGE",
                    pathPDFStore: "PathPDF"
             
                });

                $tmp_http.post("../server/Server_Gunbook.aspx", data, config)
                    .success(function (data, status, headers, config) {

                        //if (data.output == 'OK') {
                        //    window.parent.refreshAllData();
                        //    fnCloseImg();
                        //    fnUnLoading();
                        //    return;
                        //} else {
                        //    loadData($scope, $http);
                        //    fnCloseImg();
                        //    fnUnLoading();
                        //    alert(data.MSG);
                        //}
                    })
                    .error(function (data, status, header, config) { });
            }

            }

        function loadData($scope, $http, ID) {

            var data = $.param({
                Command: 'LoadDataLastVersion',
                BOOKNO: BOOKNO,
                PAGENO: PAGENO
            });

            $http.post("../server/Server_Gunbook.aspx", data, config)
                .success(function (data, status, headers, config) {
                    if (data.output == "OK") {

                        document.getElementById('bookno').innerHTML = BOOKNO;
                        document.getElementById('pageno').innerHTML = PAGENO;
                        document.getElementById('pagever').innerHTML = LASTVERSION;
                        BOOKYEAR = data.bookYear;
                      
                        var version =  data.version;
                        var SP = version.split(',');
                        
                        var lastVer = SP.length - 1;
                        var lastVerV = "";
                        var newPage = SP.length+1;
                        var currentVer = SP.length;

                        var _lVerLoad = "";
                      
                     
                        $("#imgVersion").append("<option id='" + newPage + "' value='" + newPage + "'>" + newPage + " (ใหม่)" + "</option>");
 
                        for (var i = SP.length-1; i >=0; i--) {
                            if (SP[i] == newPage-1) {
                                $("#imgVersion").append("<option id='" + SP[i] + "' value='" + SP[i] + "' selected='selected'>" + SP[i] + " (ปัจจุบัน)" + "</option>");
                                _lVerLoad = SP[i];
                            }
                            else {
                                $("#imgVersion").append("<option id='" + SP[i] + "' value='" + SP[i] + "'>" + SP[i] + "</option>");
                            }

                        }
 
                        //------------------Load Image last version-------
                       
                        //-------------------------------------------
                        if (STATUS == '1') {

                       document.getElementById(NEWVERSION).selected = "true";
                          
                        var data2 = $.param({
                            Command: 'GetImage',
                            bookno: BOOKNO,
                            pageno: PAGENO,
                            pagever: NEWVERSION

                        });
                       
                        $http.post("../server/Server_Gunbook.aspx", data2, config)
                            .success(function (data, status, headers, config) {
                                if (data.output == 'OK') {
                                   
                                    tmp_src_img = data.imgPath;
                                    img_base64 = data.imgStr;
                                     if (STATUS == '1' ) {
                                        $("#viewer2").iviewer(
                                            {
                                                src: "data:image/png;base64," + data.imgStr
                                            });
                                    } 
                                   
                                } else {
                                  
                                    alert(data.MSG);
                                }
                             
                            })
                            .error(function (data, status, header, config) { });
                        }
                        else if (Cstatus!="1"){

                            window.open('updateVersionImg.aspx?BOOKNO=' + BOOKNO + '&PAGENO=' + PAGENO + '&LASTVERSION=' + LASTVERSION + '&NEWVERSION=' + _lVerLoad + '&STATUS=1', '_self');
                        }
                        //else {
                        //  //  document.getElementById(NEWVERSION).selected = "true";
                  
                        //    window.open('updateVersionImg.aspx?BOOKNO=' + BOOKNO + '&PAGENO=' + PAGENO + '&LASTVERSION=' + LASTVERSION + '&NEWVERSION=' + _lastVer + '&STATUS=1', '_self');
                        //}
                        //------------------------
                         fnUnLoading();

                    } else {
                        showmessage(data.MSG);
                    }
                })
                .error(function (data, status, header, config) { });
        }
        var $http_gobal;
   
        function fnOpenImage() {
            var index = document.getElementById("imgVersion").selectedIndex;
            var NEWVERSION = document.getElementsByTagName("option")[index].value;
            window.open('updateVersionImg.aspx?BOOKNO=' + BOOKNO + '&PAGENO=' + PAGENO + '&LASTVERSION=' + LASTVERSION + '&NEWVERSION=' + NEWVERSION + '&STATUS=1', '_self');
        }
        function fnCloseImg() {
            var index = document.getElementById("imgVersion").selectedIndex;
            var STATUS = document.getElementsByTagName("option")[index].value;
            window.open('updateVersionImg.aspx?BOOKNO=' + BOOKNO + '&PAGENO=' + PAGENO + '&LASTVERSION=' + STATUS + '&Cstatus=1' , '_self');
        }
        
        var handleFileSelect = function (evt) {
 
            var index = document.getElementById("imgVersion").selectedIndex;
            var STATUS = document.getElementsByTagName("option")[index].value;
            var files = evt.target.files;
            var file = files[0];

            fnLoading

            if (!FileReader.prototype.readAsBinaryString) {
                FileReader.prototype.readAsBinaryString = function (fileData) {
                    var binary = "";
                    var pt = this;
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        var bytes = new Uint8Array(reader.result);
                        var length = bytes.byteLength;
                        for (var i = 0; i < length; i++) {
                            binary += String.fromCharCode(bytes[i]);
                        }

                        img_base64New = btoa(binary);
                        stateImg = "true";
                        $("#viewer2").iviewer(
                            {
                                src: "data:image/png;base64," + btoa(binary)
                            });

                        //pt.result  - readonly so assign binary
                        pt.content = binary;
                        $(pt).trigger('onload');

                    
                    }
                    reader.readAsArrayBuffer(fileData);
                }
            }


            if (files && file) {
                var reader = new FileReader();

                reader.onload = function (readerEvt) {

                    var binaryString = readerEvt.target.result;
                    img_base64New = btoa(binaryString);
                    stateImg = "true";
                    $("#viewer2").iviewer(
                        {
                            src: "data:image/png;base64," + btoa(binaryString)
                        });

                    fnUnLoading();
                   // window.open('updateVersionImg.aspx?BOOKNO=' + BOOKNO + '&PAGENO=' + PAGENO + '&LASTVERSION=' + STATUS + '&STATUS=2' + STATUS, '_self');

                };

                reader.readAsBinaryString(file);
            }
            fnUnLoading();
        };
        if (window.File && window.FileReader && window.FileList && window.Blob) {
            document.getElementById('fileInput').addEventListener('change', handleFileSelect, false);
        } else {
            alert('The File APIs are not fully supported in this browser.');
        }


        function getParamValue(name) {
            var url = location.href;
            name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
            var regexS = "[\\?&]" + name + "=([^&#]*)";
            var regex = new RegExp(regexS);
            var results = regex.exec(url);
            return results == null ? null : results[1];
        }

        function formatDate(date) {
            var sYear = date.getFullYear();
            if (sYear < 2400)
                sYear = sYear + 543;
            var sMonth = date.getMonth() + 1;

            return date.getDate() + "/" + sMonth + "/" + sYear + "  " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
        }

        function openWindowWithPost(pathimg) {
            var f = document.getElementById('TheForm');
            f.pathimg.value = pathimg;
            window.open('', 'TheWindow');
            f.submit();
        }

        function openImage() {
            window.open('showimage.aspx?Book=' + document.getElementById('bookno').innerHTML + '&Page=' + document.getElementById('pageno').innerHTML + '&Ver=' + document.getElementById('pagever').innerHTML, '_blank');
        }


        function daysInMonth(m, y) { // m is 0 indexed: 0-11
            switch (m) {
                case 1:
                    return (y % 4 == 0 && y % 100) || y % 400 == 0 ? 29 : 28;
                case 8: case 3: case 5: case 10:
                    return 30;
                default:
                    return 31
            }
        }

        function handle(e) {
            if (e.keyCode === 13) {
                return;
            }
        }

        document.addEventListener("keypress", keyDownTextField, false);

        function keyDownTextField(e) {
            var keyCode = e.keyCode;
            if (keyCode == 13) {
                return;
            }
        }
    </script>

</body>
</html>
