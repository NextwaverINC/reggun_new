<%@ Page Language="C#" AutoEventWireup="true" CodeFile="waterMask.aspx.cs" Inherits="users_user" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta charset="utf-8" />
	<title>Nestable lists - Ace Admin</title>

	<meta name="description" content="Drag &amp; drop hierarchical list" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

    <meta name="description" content="Drag &amp; drop file upload with image preview" />
         <script src="../js.iviewer/test/jquery.js"></script>
    <script src="../js.iviewer/test/jqueryui.js"></script>
    <script src="../js.iviewer/test/jquery.mousewheel.min.js"></script>
    <script src="../js.iviewer/jquery.iviewer.js"></script>
	<!-- bootstrap & fontawesome -->
	<link rel="stylesheet" href="../assets/css/bootstrap.css" />
	<link rel="stylesheet" href="../assets/css/font-awesome.css" />

 
	<link rel="stylesheet" href="../assets/css/ace-fonts.css" />

	<!-- ace styles -->
	<link rel="stylesheet" href="../assets/css/ace.css" class="ace-main-stylesheet"  />

 

    <script src="../Scripts/angular.min.js"></script>
    <style>
        .checkstyle {
                cursor: pointer;
                height: 30px;
                min-width: 30px;  
        }       
    </style> 
    
        
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
<body style="background-color:white">
    <form id="form1" runat="server">
       <div id="mainApp" ng-app="myApp" ng-controller="StartApp">
           <div class="widget-box transparent"  id="widget-box-2">
				<!-- #section:custom/widget-box.options -->
				<div class="widget-header">
					<h5 class="widget-title bigger lighter">
						<i class="ace-icon fa fa-cog"></i>
						กำหนดกลุ่มลายน้ำ
					</h5>								
				</div>
				<!-- /section:custom/widget-box.options -->
				<div class="widget-body">
					<table style="width:100%">
                       <tr><td colspan="20" style="height:20px"></td></tr>
                          <tr>
                           <td style="width:20px"></td>
                       </tr>
                        <tr><td colspan="5" style="height:5px"></td></tr>
                        <tr>
                           <td style="width:20px"></td>
                           <td>
                               <div class="radio">
                                    <label>
                                        <input name="form-field-radio" type="radio" class="ace ace input-sm" id="rd1" />
                                        <span class="lbl bolder control-label padding-right"> &nbsp; กลุ่มตามปี</span>
                                    </label>
                                </div>
                           </td>
                           <td style="width:5px"></td>
                           <td><input type="text" id="maskYear" placeholder="ปี พ.ศ." maxlength="4" size="4" style="width: 100%" min="2480" /></td>
 
                           <td style="width:20px"></td>
                       </tr>
                       <tr><td colspan="5" style="height:5px"></td></tr>
       
                         <tr>
                           <td style="width:20px"></td>
                           <td>
                               <div class="radio">
                                    <label>
                                        <input name="form-field-radio" type="radio" class="ace ace input-sm" id="rd2"  />
                                        <span class="lbl bolder control-label padding-right"> &nbsp; กลุ่มตามหน่วยงาน</span>
                                    </label>
                                </div>
                           </td>
                           <td style="width:5px"></td>
                           <td><input type="text" id="departmentName" placeholder="ชื่อหน่วยงาน" style="width:100%" /></td>
                           <td style="width:20px"></td>
                       </tr>
                              <tr><td colspan="5" style="height:5px"></td></tr>
       
                         <tr>
                           <td style="width:20px"></td>
                           <td>
                               <div class="radio">
                                    <label>
                                        <input name="form-field-radio" type="radio" class="ace ace input-sm" id="rd3"  />
                                        <span class="lbl bolder control-label padding-right"> &nbsp; กลุ่มอื่นๆ</span>
                                    </label>
                                </div>
                           </td>
                           <td style="width:5px"></td>
                           <td><input type="text" id="otherGroup" placeholder="กลุ่มอื่นๆ" style="width:100%" /></td>
                           <td style="width:20px"></td>
                       </tr>
                        <tr>
                            <td colspan="5" style="height: 5px"></td>
                        </tr>
  
                   </table>
				</div>
			</div>

 					
 <div class="widget-box transparent"  id="widget-box-2">
				<!-- #section:custom/widget-box.options -->
      <td colspan="5" style="height: 5px"></td>
				<div class="widget-header">
					<h5 class="widget-title bigger lighter">
						<i class="ace-icon fa fa-upload"></i>
						อัพโหลดลายน้ำ
					</h5>								
				</div>
				<!-- /section:custom/widget-box.options -->
        </br>
     <label style="color:red">*กรุณาเลือกไฟล์ลายน้ำ เฉพาะนามสกุล .png ขนาด 3000X4200 px.</label>
				<div class="widget-body">
					  <input id="fileInput" type="file" />
				</div>
                     <%--<label>
                          <span class="lbl bolder control-label padding-right"> &nbsp; **</span>
                    </label>--%>
               
			</div>
               <label id="ERROR" style="color:red"></label>
           </div>
          <div class="wrapper" style="height:300px">
              <div id="viewer2" class="viewer" style="width: 100%; background-color: #d2d2d2;"></div>
           <%-- <div id="viewer2" class="viewer" style="width: 100%; background-color: #d2d2d2;"></div>--%>
         
              </div>
        </br>
           <div>
               <a class="btn btn-primary" onclick="fnSave()" style="width:49%">
                   <i class="ace-icon fa fa-floppy-o align-top bigger-125"></i>
                   บันทึก
               </a> 
               <a class="btn btn-danger" onclick="fnClose()" style="width:49%">
                   <i class="ace-icon fa fa-remove align-top bigger-125"></i>
                   ยกเลิก
               </a>               
           </div>   
        
          <div id="loading" style="display:none;margin-top:50px">
           <center>
                <h1 class="bigger"><i class="ace-icon fa fa-spinner fa-spin orange"></i></h1>
                <h3>                    
                    อยู่ระหว่างประมวลผลโปรดรอ...
                </h3>
            </center>
        </div>
   
    </form>
   
        <script>
            var img_base64new = "";
            var state = "";

            var handleFileSelect = function (evt) {

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
                        state = "true";
                        var binaryString = readerEvt.target.result;
                         img_base64New = btoa(binaryString);

                     //   document.getElementById('viewer2').innerHTML = "<div class='viewer' tyle='width: 100%; background-color: #d2d2d2;'></div>";
                        //  console.log(btoa(binaryString));
                        //   stateImg = "true";
                        $("#viewer2").iviewer(
                            {
                                src: "data:image/png;base64," + btoa(binaryString)
                            });

                        fnUnLoading();

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
            

            function fnSave() {

                var maskYear = document.getElementById('maskYear').value;
                var departmentName = document.getElementById('departmentName').value;
                var otherGroup = document.getElementById('otherGroup').value;
                
                var ERROR = document.getElementById('ERROR');

                ERROR.innerHTML = "";

                if ($("#rd1").is(':checked') && maskYear == "") {
                    ERROR.innerHTML = "โปรดระบุปี";
                    return;
                }
                if ($("#rd2").is(':checked') && departmentName == "") {
                    ERROR.innerHTML = "โปรดระบุชื่อหน่วยงาน";
                    return;
                }
                if ($("#rd3").is(':checked') && otherGroup == "") {
                    ERROR.innerHTML = "โปรดระบุชื่อกลุ่มอื่นๆ";
                    return;
                }
                if (state=="") {
                    ERROR.innerHTML = "โปรดเลือกไฟล์อัพโหลด";
                    return;
                }

                var mYear="";
                var mDepartm = "";
                var mOther = "";

                if ($("#rd1").is(':checked')) {
                    mYear = maskYear;
                    mDepartm = "";
                    mOther = "";
                }
                if ($("#rd2").is(':checked')) {
 
                    mYear = "";
                    mDepartm = departmentName;
                    mOther = "";
                }
                if ($("#rd3").is(':checked')) {

                    mYear = "";
                    mDepartm = "";
                    mOther = otherGroup;
                }


                var data = $.param({
                    Command: 'SaveWaterMask',
                    ID: getParamValue("ID"),
                    maskYear: mYear,
                    departName: mDepartm,
                    otherG : mOther,
                    imgBase64: img_base64New
                });

                $tmp_http.post("../server/Server_User.aspx", data, config)
                    .success(function (data, status, headers, config) {
                        if (data.output == 'OK') {
                            window.parent.refreshAllData();
                            return;
                        } else {
                            ERROR.innerHTML = data.MSG;
                         //   fnUnLoading();
                        }
                    })
                    .error(function (data, status, header, config) { });
            }
            function fnLoading() {
                document.getElementById("mainApp").style.display = "none";
                document.getElementById("loading").style.display = "";
                $('#rd1').attr("checked", "checked");
            }
            function fnUnLoading() {
                document.getElementById("mainApp").style.display = "";
                document.getElementById("loading").style.display = "none";
            }
            function fnClose() {
                window.parent.closepopup();
            }
            //======================================================
            var app = angular.module('myApp', []);
            var config = { headers: { 'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;' } }
            app.controller('StartApp', StartApp);
            var $tmp_scope;
            var $tmp_http;
            function StartApp($scope, $http) {
                $('#rd1').attr("checked", "checked");
                $tmp_scope = $scope;
                $tmp_http = $http;

                var ID = getParamValue("ID");
                loadData($scope, $http, ID);
              
            }
            var img_base64;
            var tmp_src_img;
            function LoadImgWaterMask($scope, $http) {
                
                    var data2 = $.param({
                        Command: 'GetImage',
                        bookno: 80,
                        pageno: 1,
                        pagever: 2

                    });

                    $http.post("../server/Server_Gunbook.aspx", data2, config)
                        .success(function (data, status, headers, config) {
                            if (data.output == 'OK') {

                                fnUnLoading();
                                tmp_src_img = data.imgPath;
                                img_base64 = data.imgStr;

                               
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
             

            }
            function loadData($scope, $http, ID) {
 
                var data = $.param({
                    Command: 'LoadDataWaterMask',
                    ID: ID
                });

                $http.post("../server/Server_User.aspx", data, config)
                    .success(function (data, status, headers, config) {
                        if (data.output == "OK") {

                            //document.getElementById('maskYear').value = data.GROUP_TYPE;
                            //document.getElementById('departmentName').value = data.WATERMASK_NAME;


                            console.log(data.WATERMASK_NAME);

                            var _groupType = data.GROUP_TYPE;
                            var _wtName = data.WATERMASK_NAME;

                            if (_groupType =="กลุ่มตามปี") {
                                $('#rd1').attr("checked", "checked");
                                document.getElementById('maskYear').value = data.WATERMASK_NAME;
                            }
                            else if (_groupType =="กลุ่มตามหน่วยงาน") {
                                $('#rd2').attr("checked", "checked");
                                document.getElementById('departmentName').value = data.WATERMASK_NAME;

                            }
                            else if (_groupType =="กลุ่มอื่นๆ") {
                                $('#rd3').attr("checked", "checked");
                                document.getElementById('otherGroup').value = data.WATERMASK_NAME;

                            }

                            fnUnLoading();

                        } else {
                            showmessage(data.MSG);
                        }
                    })
                    .error(function (data, status, header, config) { });

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
