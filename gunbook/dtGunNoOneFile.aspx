<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dtGunNoOneFile.aspx.cs" Inherits="gunbook_showimage" %>

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

 textarea {
            overflow-y: scroll;
            height: 600px;
             width:100%;
            resize: none; /* Remove this if you want the user to resize the textarea */
        }




 label {
  padding: 10px;
  display: block;
  text-align: right;
}
      </style>
</head>
<body style="background-color: white">
    <div class="container">
        <div class="row">
            <form id="form1" runat="server">

                <script language="JavaScript">
                    document.onkeydown = chkEvent
                    function chkEvent(e) {
                        var keycode;
                        if (window.event) keycode = window.event.keyCode; //*** for IE ***//
                        else if (e) keycode = e.which; //*** for Firefox ***//
                        if (keycode == 13) {
                            return false;
                        }
                    }
            </script>
                <div id="mainApp" ng-app="myApp" ng-controller="StartApp">
                    <div class="widget-box transparent" id="widget-box-1">
                        <div class="widget-header widget-header-small">
                            <h4 class="widget-title blue smaller">
                                <i class="ace-icon fa fa-edit blue"></i>
                                {{titleHead}} ระบบนำเข้าหมายเลขปืน
                            </h4>

                       
                            <div class="widget-toolbar">
                       
        
                                <a class="btn btn-danger" onclick="fnClose()" style="width: 100px;">
                                    <i class="ace-icon fa fa-remove"></i>
                                    ปิด
                                </a>
                            </div>
                        </div>

                        <div class="widget-body">
                              <div class="row">
            <div class="col-xs-12">
                    <div>
                      <div class="error-container">
                                    <div class="well">
                                     
                                        <div>
                                              <div class="row">
                                                   <div class="col-sm-1">
           
                               <a class="btn btn-primary btn-sm" onclick="fnSetValue()"  ng-click="fnSave()" style="width: 110px;">
                                    <i class="ace-icon fa fa-floppy-o"></i>
                                    บันทึกข้อมูล
                                </a>
                                            </div>
                                                   <div class="col-sm-3">
           
                               <a class="btn btn-info btn-sm" onclick=""  ng-click="" style="float: right; width: 200px;">
                                      <i class="ace-icon fa fa-info"></i>
                                    รูปแบบและเงื่อนไขการป้อน
                                </a>
                                            </div>
                        
                                                  <div class="col-sm-2">
                                  
                                   <label style="float: right;" id="bookNo" ></label>
                                            </div>
                                                   <div class="col-sm-1">
                                  
                                   <label  style="float: right;">หน้าที่ :</label>
                                            </div>
                                                  <div class="col-sm-1">
                                             
                          <input type="number" class="form-control" id="pageNo"  value="1"  min="1" style=" background-color: #f7f7f7; width: 90px;" />
                                            </div>


                                                  <div class="col-sm-1">
           
                                 <a class="btn btn-primary btn-success btn-sm"  onclick="fnSetValue()"  ng-click="fnOpenImagePref('search')" style="width:85px;">
                                      <i class="ace-icon fa fa-picture-o bigger-110"></i> ค้นหา
                                    </a>
                                            </div>


                     <div class="col-sm-2">
                        
                                <a class="btn btn-info" style=" border: 0px;" onclick="fnSetValue()"  ng-click="fnOpenImagePref('prev')">
                                        ก่อนหน้า
                                    </a>
                        
                         <a class="btn btn-info" style="float: right; border: 0px; width:83px" onclick="fnSetValue()" ng-click="fnOpenImagePref('next')">
                                        ถัดไป
                                    </a>
                                            </div>

          

                                            </div>
                                        </div>


                                         <div>
                                              <div class="row">
                                                     <div class="col-sm-4">

                                                         <textarea id="dtGunNo" name="message"></textarea>  

                                                     </div>
                                                 <div class="col-sm-8">
                                                   
                  
                         <div class="wrapper" style="height: 600px;width:100%;">
                     
                 <div id="viewer" class="viewer" style="width: 100%; background-color: #d2d2d2;"></div>
     
                             <div id="loadingIMG" style="display: none; margin-top: 50px">
   
                        <%--      <div id="loadingIMG" style="display: none; margin-top: 50px">--%>
            <center>
                <h1 class="bigger"><i class="ace-icon fa fa-spinner fa-spin orange"></i></h1>
                <h3>                    
                    กำลังโหลดรูปภาพ...
                </h3>
            </center>
        </div>
        </div>                                
                                                 
                                                     </div>
                                            </div>
                                        </div>
        
                                    </div>
                                </div>
                    </div>
            </div>
        </div>
                           

   
                        </div>
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
            </form>
 
        </div>
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


        function fnLoadingIMG() {
             document.getElementById("loadingIMG").style.display = "";
        }
        function fnUnLoadingIMG() {
             document.getElementById("loadingIMG").style.display = "none";
        }
        


        var $ = jQuery;

        var $scope_gobal;
        var $http_gobal;
        var data_gobal;
        var column_gobal;
        var tmp_grp_id;
        var img_base64;
        var tmpBookNo;
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
        var tmpStateIMG;
        var tmpPageNo;
        function StartApp($scope, $http) {

          /*  $scope.bookno = parseInt(getParamValue("Book"));
            $scope.pageno = parseInt(getParamValue("Page"));*/

        /*    var BOOKNO = getParamValue("Book");
            var PAGENO = getParamValue("Page");

            alert(PAGENO, BOOKNO);
            */
   

            if (tmpPageNo == null || tmpPageNo =='undefined') tmpPageNo = 1;

          

            var ID = getParamValue("ID");
 
               
                var data = $.param({
                    Command: 'fnGetFileGunNo',
                    ID: ID,
                    pageNo: tmpPageNo,

                });
                  fnLoading();
                    $http.post("../server/Server_Gunbook.aspx", data, config)
                        .success(function (data, status, headers, config) {
                            if (data.output == 'OK') {
                              fnUnLoading();

                                //  alert("Hello\r\nMudassar");

                                // dtGunNo

                                var mystring = data.dtGunNo;
                                var newchar = '\r\n';
                                mystring = mystring.split('@nl').join(newchar);


                                fnUnLoadingIMG();
                                tmpBookNo = data.bookNo;
                                document.getElementById("dtGunNo").value = mystring;
                                document.getElementById('bookNo').innerHTML = "เล่มที่ : " + data.bookNo;
                                console.log(data.output);

                           $("#viewer").iviewer(
                                            {
                                                src: "data:image/png;base64," + data.imgStr
                                            }); 

                            } else {
                                fnUnLoading();
                                alert(data.MSG);
                            }
                        })
                        .error(function (data, status, header, config) { });
 
          $scope.fnSave = function () {
              var result = document.getElementById("dtGunNo").value;
              fnLoading();
              var data = $.param({
                  Command: 'fnSaveFileGunNo',
                  ID: getParamValue("ID"),
                  bookno: tmpBookNo,
                  text: result

              });

              $http.post("../server/Server_Gunbook.aspx", data, config)
                  .success(function (data, status, headers, config) {
                      if (data.output == 'OK') {
                          alert("บันทึกข้อมูลสำเร็จ");
                          fnUnLoading();


                          //    window.parent.refreshAllData();
                          return;
                      } else {
                          ERROR.innerHTML = data.MSG;
                          alert(data.MSG);

                      }
                  })
                  .error(function (data, status, header, config) { });
          }

          $scope.fnOpenImage = function () {
            //  $('#viewer').hide();
              var _pageIndex = 2;
              fnLoadingIMG();
              var data = $.param({
                  Command: 'GetImage',
                  // bookno: tmpBookNo,
                  bookno: '262',
                  pageno: _pageIndex,
                  pagever: '1',

              });

              $http.post("../server/Server_Gunbook.aspx", data, config)
                  .success(function (data, status, headers, config) {
                      if (data.output == 'OK') {

                          fnUnLoadingIMG;
                          $("#viewer").iviewer(
                              {
                                  src: "data:image/png;base64," + data.imgStr
                              });

                          tmpStateIMG = "F";
                          $("#viewer").show();


                      } else {
                          fnUnLoadingIMG;
                          alert(data.MSG);
                      }
                  })
                  .error(function (data, status, header, config) { });
                
            }

   $scope.fnOpenImagePref = function (type) {
              var _pageIndex;
              if (type == 'next') {
                  _pageIndex = parseInt(tempPAGENO) + 1;

              } else if (type =='next') {
                  _pageIndex = parseInt(tempPAGENO) - 1;     
              } else {
                  _pageIndex = 1;
              }
            

               $('#viewer').hide();

                fnLoadingIMG();
                var data = $.param({
                    Command: 'GetImage',
                   // bookno: tmpBookNo,
                    bookno: '262',
                    pageno: _pageIndex,
                    pagever: '1',

                });

                $http.post("../server/Server_Gunbook.aspx", data, config)
                    .success(function (data, status, headers, config) {
                        if (data.output == 'OK') {

                            fnUnLoadingIMG;
  
                          $("#viewer").iviewer(
                               {
                        
                                    src:   "data:image/png;base64," + data.imgStr
                                });
                
                            $("#viewer").show();


                        } else {
                        
                            alert(data.MSG);
                            fnUnLoadingIMG;
                        }
                    })
                    .error(function (data, status, header, config) { });
          }


          

        /*  $scope.fnOpenImagePref = function (type) {
              fnLoadingIMG();
              tmpPageNo = 2;
              fnUnLoadingIMG;
            /*  if (type == 'next') {
                  var _pageNext = parseInt(tempPAGENO) + 1;

                  window.open('dtGunNoOneFile.aspx?Book=' + tmpBookNo + '&Page=2', '_self');
                  tmpPageNo = 2;

              } else {
                  var _pagePrev = parseInt(tempPAGENO) - 1;
                  if (_pagePrev != 0) {
                      window.open('dtGunNoOneFile.aspx?Book=' + tmpBookNo + '&Page=' + _pagePrev, '_self');
                      tmpPageNo = 2;
                  }
              }


          }*/

            $scope.fnReportImage = function () {
           //     alert('call function');
                fnSetLog("หน้าแสดงภาพสแกน", "ReportImage", "รายงานภาพเอียง เล่ม " + getParamValue("Book") + " หน้า " + getParamValue("Page"));
            }

        }
        var tempBOOKNO;
        var tempPAGENO;
        function fnSetValue() {
 
            tempPAGENO = document.getElementById('pageNo').value; 

        }
        function getParamValue(name) {
            var url = location.href;
            name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
            var regexS = "[\\?&]" + name + "=([^&#]*)";
            var regex = new RegExp(regexS);
            var results = regex.exec(url);
            return results == null ? null : results[1];
        }
        function fnClose() {
            window.parent.closepopupfull();
        }
    </script>
</body>
</html>
