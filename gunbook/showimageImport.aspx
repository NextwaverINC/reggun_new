﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="showimageImport.aspx.cs" Inherits="gunbook_showimage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="height: 100%">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
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

     <style type="text/css">
      .btn {
  background-color: #4285f4;
}

.btn:hover {
  background-color: #296CDB;
}

.btn:focus {
  background-color: #0F52C1;

  /* The outline parameter surpresses the border
  color / outline when focused */
  outline: 0;
}

.btn:active {
  background-color: #0039A8;
}     
      </style>
</head>
<body style="height: 100%">
    <div id="mainApp" ng-app="myApp" ng-controller="StartApp" style="height: 100%">
        <div>
            <div class="row" style="padding: 10px; background-color: #d2d2d2;">
                <div class=" col-sm-10">
                    <div class="form-group" style="margin: 0px">
                        <center>
                        <table>
                            <tr>
                                <td style="width: 50px;"></td>
                                <td style="width: 150px;" class="text-right"><span class="text-right"><strong>เลขหนังสือ :</strong>&nbsp;&nbsp;</span></td>
                                <td style="width: 120px;">
                                    <input type="number" class="form-control" ng-model="bookno" id="_bookNo" min="1" style="width: 100%; background-color: #f7f7f7;" />
                                </td>
                                <td style="width: 100px;" style="width: 100px;" class="text-right"><span class="text-right"><strong>หน้า :</strong>&nbsp;&nbsp;</span></td>
                                <td style="width: 120px;">
                                    <input type="number" class="form-control" ng-model="pageno" id="_pageNo" min="1" style="width: 100%; background-color: #f7f7f7;" />
                                </td>
                              
                            <td style="width: 100px;" class="text-right">
                                
                                    <button class="btn btn-info" style="float: right; border: 0px;" onclick="fnSetValue()" ng-click="fnOpenImage()">
                                        ดูรูปภาพ
                                    </button>
                                </td>
 

                                  <td style="width: 77px;" class="text-right">
                                    <button class="btn btn-info" style="float: right; border: 0px;" onclick="fnSetValue()"  ng-click="fnOpenImagePref('prev')">
                                        ก่อนหน้า
                                    </button>
                                </td> 

                                  <td style="width: 60px;" class="text-right">
                                    <button class="btn btn-info" style="float: right; border: 0px;" onclick="fnSetValue()" ng-click="fnOpenImagePref('next')">
                                        ถัดไป
                                    </button>
                                </td> 
                                        <td style="width: 125px;" class="text-right">
                                    <button class="btn btn-info" style="float: right; border: 0px;"   ng-click="fnReportImage()">
                                        รายงานภาพเอียง
                                    </button>
                                </td> 

                                <td style="width:5px"></td>
          
                            </tr>
                        </table>
                            </center>
  
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


        function fnSetLog(Menu, FN_Name, Detail) {

        //    alert(Menu+' '+FN_Name+' '+Detail);

            var data = $.param({
                Command: 'set_log',
                Menu: Menu,
                FN_Name: FN_Name,
                Detail: Detail
            });

            $http_gobal.post("../server/Server_Gunbook.aspx", data, config)
                .success(function (data, status, headers, config) {
                    alert(Menu + ' ' + FN_Name + ' ' + Detail);
                })
                .error(function (data, status, header, config) {
                    alert('ERROR');
                });
        }

        function StartApp($scope, $http) {
            $scope.bookno = parseInt(getParamValue("Book"));
            $scope.pageno = parseInt(getParamValue("Page"));
            $scope.pagever = parseInt(getParamValue("Ver"));
           
            fnLoading();

            var BOOKNO = getParamValue("Book");
            var PAGENO = getParamValue("Page");
            var PAGEVER = getParamValue("Ver");

            var data = $.param({
                Command: 'GetImage',
                bookno: getParamValue("Book"),
                pageno: getParamValue("Page"),
                pagever: getParamValue("Ver"),

            });
          
            $http.post("../server/Server_Gunbook.aspx", data, config)
                .success(function (data, status, headers, config) {
                    if (data.output == 'OK') {
                        fnUnLoading();
     
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
                
 
                    window.open('showimageImport.aspx?Book=' + tempBOOKNO + '&Page=' + tempPAGENO + '&Ver=1', '_self');
                
            }

            $scope.fnOpenImagePref = function (type) {
                if (type == 'next') {
                    var _pageNext = parseInt(tempPAGENO) + 1;

                    window.open('showimageImport.aspx?Book=' + tempBOOKNO + '&Page=' + _pageNext + '&Ver=1', '_self');


                } else {
                    var _pagePrev = parseInt(tempPAGENO) - 1;
                    if (_pagePrev != 0) {
                        window.open('showimageImport.aspx?Book=' + tempBOOKNO + '&Page=' + _pagePrev + '&Ver=1', '_self');
                    }
                }


            }

            $scope.fnReportImage = function () {
           //     alert('call function');
                fnSetLog("หน้าแสดงภาพสแกน", "ReportImage", "รายงานภาพเอียง เล่ม " + getParamValue("Book") + " หน้า " + getParamValue("Page"));
            }

        }
        var tempBOOKNO;
        var tempPAGENO;
        function fnSetValue() {

            tempBOOKNO = document.getElementById('_bookNo').value;
            tempPAGENO = document.getElementById('_pageNo').value;

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
