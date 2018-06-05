<%@ Page Language="C#" AutoEventWireup="true" CodeFile="showimage.aspx.cs" Inherits="gunbook_showimage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="height: 100%">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>รูปภาพ</title>
    <script src="../js.iviewer/test/jquery.js"></script>
    <script src="../js.iviewer/test/jqueryui.js"></script>
    <script src="../js.iviewer/test/jquery.mousewheel.min.js"></script>
    <script src="../js.iviewer/jquery.iviewer.js"></script>
    <link rel="stylesheet" href="../assets/css/bootstrap.css" />
    <script src="../Scripts/angular.min.js"></script>


     <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="../assets/css/bootstrap.css" />
    <link rel="stylesheet" href="../assets/css/font-awesome.css" />

    <!-- page specific plugin styles -->

    <!-- text fonts -->
    <link rel="stylesheet" href="../assets/css/ace-fonts.css" />

    <!-- ace styles -->
    <link rel="stylesheet" href="../assets/css/ace.css" class="ace-main-stylesheet" />

    
    <script src="../assets/js/ace-extra.js"></script>

  


    <%--<script type="text/javascript">
        
        $(document).ready(function () {

            var iv2 = 
        });
    </script>--%>
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
<body style="height: 100%">
    <div id="mainApp" ng-app="myApp" ng-controller="StartApp" style="height: 100%">
        <div>
            <div class="row" style="padding: 10px; background-color: #d2d2d2;">
         
                <div class=" col-sm-10">
                    <div class="form-group" style="margin: 0px">
                        <table>
                            <tr>
                                <td style="width: 50px;"></td>
                                <td style="width: 150px;" class="text-right"><span class="text-right"><strong>เลขหนังสือ :</strong>&nbsp;&nbsp;</span></td>
                                <td style="width: 120px;">
                                    <input type="number" class="form-control" ng-model="bookno" min="1" style="width: 100%; background-color: #f7f7f7;" />
                                </td>
                                <td style="width: 100px;" style="width: 100px;" class="text-right"><span class="text-right"><strong>หน้า :</strong>&nbsp;&nbsp;</span></td>
                                <td style="width: 120px;">
                                    <input type="number" class="form-control" ng-model="pageno" min="1" style="width: 100%; background-color: #f7f7f7;" />
                                </td>
                                <td style="width: 100px;" class="text-right"><span class="text-right"><strong>เวอร์ชั่น :</strong>&nbsp;&nbsp;</span></td>
                                <td style="width: 100px;">
                                    <input type="number" class="form-control" ng-model="pagever" min="1" style="width: 100%; background-color: #f7f7f7;" />
                                </td>
                                <td style="width: 100px;" class="text-right">
                                    <button class="btn btn-info" style="float: right; border: 0px;" ng-click="fnOpenImage()">
                                        ดูรูปภาพ
                                    </button>
                                </td>
                                <td style="width:5px"></td>
                                <td class="text-right">                                   
                                    <button class="btn btn-info" style="float: right; border: 0px;" onclick="fnPrint()">
                                        Print
                                    </button>
                                </td>
                                <td style="width:5px"></td>
                                <td class="text-right">                                   
                                    <a class="btn btn-info" style="float: right; border: 0px;" id="dowload_img" download="image.png">
                                        Download
                                    </a>
                                </td>   
                                <td style="width:5px"></td>
                                <td class="text-right">                                   
                                    <a class="btn btn-info" style="float: right; border: 0px;" onclick="fnEditImg()">
                                        Edit
                                    </a>
                                </td>   
        
                            </tr>
                        </table>


                    </div>
                </div>
                <div class="col-sm-2">
                    <label id="ERROR" style="color: red"></label>
                </div>
            </div>
        </div>
        <div class="wrapper" style="height: calc(100vh - 80px);">
            <div id="viewer2" class="viewer" style="width: 100%; background-color: #d2d2d2;"></div>
        </div>
        <%--<img src="data:image/png;base64,<% =imgdata %>" style="width: 100%" />--%>
    </div>
    <div id="loading" style="display: none; margin-top: 50px">
        <center>
            <h1 class="bigger"><i class="ace-icon fa fa-spinner fa-spin orange"></i></h1>
            <h3>                    
                อยู่ระหว่างประมวลผลโปรดรอ...
            </h3>
        </center>
    </div>
   
    <%--<script src="../assets/js/bootstrap.js"></script>--%>
    <script>
        function fnEditImg() {
            var win = window.open("../gunbook/edit_img/index.html");
        }
        function fnPrint() {

            var elm = {};
            var elms = document.getElementById("viewer2").getElementsByTagName("img");
            var img_tmp = "";
            for (var i = 0; i < elms.length; i++) {
                img_tmp = elms[i].src;
            }           

            var mywindow = window.open('', 'PRINT', 'height=600,width=800');

            mywindow.document.write('<html>');
            mywindow.document.write('</head><body >');           
            mywindow.document.write('<img src="' + img_tmp+'" style="width:100%"/>');
            mywindow.document.write('</body></html>');

            mywindow.document.close(); // necessary for IE >= 10
            mywindow.focus(); // necessary for IE >= 10*/

            mywindow.print();
            mywindow.close();

            return true;
            
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
        function fnLoading() {
            document.getElementById("mainApp").style.display = "none";
            document.getElementById("loading").style.display = "";
        }
        function fnUnLoading() {
            document.getElementById("mainApp").style.display = "";
            document.getElementById("loading").style.display = "none";
        }
        var $ = jQuery;

        var $scope_gobal;
        var $http_gobal;
        var data_gobal;
        var column_gobal;
        var tmp_grp_id;
        var img_base64;
        var app = angular.module('myApp', []);
        var config = { headers: { 'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;' } }
        app.controller('StartApp', StartApp);
        function StartApp($scope, $http) {
            $scope.bookno = parseInt(getParamValue("Book"));
            $scope.pageno = parseInt(getParamValue("Page"));
            $scope.pagever = parseInt(getParamValue("Ver"));

            $http_gobal = $http;

            fnSetLog("API ข้อมูลภาพสมุดนำจด", "ShowImage", "แสดงข้อมูลภาพสมุดนำจด");

            fnLoading();
            var data = $.param({
                Command: 'GetImage',
                bookno: getParamValue("Book"),
                pageno: getParamValue("Page"),
                pagever: getParamValue("Ver")
            });

            $http.post("../server/Server_Gunbook.aspx", data, config)
                .success(function (data, status, headers, config) {
                    if (data.output == 'OK') {
                        fnUnLoading();
                        img_base64 = data.imgStr;
                        document.getElementById('dowload_img').href = "data:image/png;base64," + data.imgStr;
                        $("#viewer2").iviewer(
                            {
                                src: "data:image/png;base64," + data.imgStr
                            });
                    } else {
                        fnUnLoading();
                        alert(data.MSG);
                    }
                })
                .error(function (data, status, header, config) { });


            $scope.fnOpenImage = function () {
                window.open('showimage.aspx?Book=' + $scope.bookno + '&Page=' + $scope.pageno + '&Ver=' + $scope.pagever, '_self');
            }
            $scope.reportImg = function () {
                $scope.bookno = parseInt(getParamValue("Book"));
                $scope.pageno = parseInt(getParamValue("Page"));

                fnLoading();
                var data = $.param({
                    Command: 'ReportImage',
                    bookno: getParamValue("Book"),
                    pageno: getParamValue("Page")
                });

                $http.post("../server/Server_Gunbook.aspx", data, config)
                    .success(function (data, status, headers, config) {
                        if (data.output == 'OK') {
                            fnUnLoading();
                            alert("Success");
                        } else {
                            fnUnLoading();
                            alert(data.MSG);
                        }
                    })
                    .error(function (data, status, header, config) { });
            }
        }

        function getParamValue(name) {
            var url = location.href;
            name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
            var regexS = "[\\?&]" + name + "=([^&#]*)";
            var regex = new RegExp(regexS);
            var results = regex.exec(url);
            return results == null ? null : results[1];
        }
    </script>
</body>
</html>
