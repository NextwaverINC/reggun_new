<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReportLogs.aspx.cs" Inherits="users_user" %>

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
		<%--		<div class="widget-header">
					<h5 class="widget-title bigger lighter">
						<i class="ace-icon fa fa-cog"></i>
						กำหนดกลุ่มลายน้ำ
					</h5>								
				</div>--%>
				<!-- /section:custom/widget-box.options -->
				<div class="widget-body">
					<table style="width: 100%">
                         <tr>
                            <td colspan="5" style="height: 10px"></td>
                        </tr>
                              <td style="width: 20px"></td>
                         <tr>
                               <td style="width: 20px"></td>
              
                            <td class="text-right">
                                <label> วันที่เริ่มต้น : </label>
                            </td>
                            <td style="width: 5px"></td>
                            <td>
                                 <div class="input-group">
									  <input type="text"  class="form-control date-picker" id="dateStart"  placeholder="วันที่เริ่มต้น" data-date-format="dd/mm/yyyy" />
										 <span class="input-group-addon">
												 <i class="fa fa-calendar bigger-110"></i>
										 </span>
								 </div>


                            </td>
                            <td style="width: 20px"></td>

                        </tr>
  <tr>
                            <td colspan="5" style="height: 5px"></td>
                        </tr>

                                 <tr>
                               <td style="width: 20px"></td>
              
                            <td class="text-right">
                                <label "> วันที่สิ้นสุด : </label>
                            </td>
                            <td style="width: 5px"></td>
                            <td>
                                 <div class="input-group">
									  <input type="text"  class="form-control date-picker" id="dateEnd"  placeholder="วันที่สิ้นสุด" data-date-format="dd/mm/yyyy" />
										 <span class="input-group-addon">
												 <i class="fa fa-calendar bigger-110"></i>
										 </span>
								 </div>


                            </td>
                            <td style="width: 20px"></td>

                        </tr>
                        <tr>
                            <td colspan="5" style="height: 5px"></td>
                        </tr>
                    </table>
				</div>
			</div>

               <label id="ERROR" style="color:red"></label>
           </div>
           <div>
               <a class="btn btn-primary" onclick="fnSave()" style="width:49%">
                   <i class="ace-icon fa fa-print align-top bigger-125"></i>
                   ออกรายงาน
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
        <script src="../assets/js/jquery.js"></script>

    <!-- <![endif]-->

    <!--[if IE]>
        <script src="../assets/js/jquery1x.js"></script>
        <![endif]-->
    <script type="text/javascript">
        if ('ontouchstart' in document.documentElement) document.write("<script src='../assets/js/jquery.mobile.custom.js'>" + "<" + "/script>");
    </script>
    <script src="../assets/js/bootstrap.js"></script>

<%--    <link href="../assets/bootstrap-dialog/css/bootstrap-dialog.css" rel="stylesheet" />
    <script src="../assets/bootstrap-dialog/js/bootstrap-dialog.js"></script>--%>

    <!-- page specific plugin scripts -->
    <script src="../assets/js/jquery.nestable.js"></script>

          <script src="../assets/js/date-time/bootstrap-datepicker.js"></script>
		<script src="../assets/js/date-time/bootstrap-timepicker.js"></script>
		<script src="../assets/js/date-time/moment.js"></script>
		<script src="../assets/js/date-time/daterangepicker.js"></script>
		<script src="../assets/js/date-time/bootstrap-datetimepicker.js"></script>


    <!-- ace scripts -->
    <script src="../assets/js/ace/elements.scroller.js"></script>
    <script src="../assets/js/ace/elements.colorpicker.js"></script>
    <script src="../assets/js/ace/elements.fileinput.js"></script>
    <script src="../assets/js/ace/elements.typeahead.js"></script>
    <script src="../assets/js/ace/elements.wysiwyg.js"></script>
    <script src="../assets/js/ace/elements.spinner.js"></script>
    <script src="../assets/js/ace/elements.treeview.js"></script>
    <script src="../assets/js/ace/elements.wizard.js"></script>
    <script src="../assets/js/ace/elements.aside.js"></script>



        <!-- inline scripts related to this page -->
		<script type="text/javascript">
            jQuery(function ($) {

                //datepicker plugin
                //link
                $('.date-picker').datepicker({
                    autoclose: true,
                    todayHighlight: true
                })
                    //show datepicker when clicking on the icon
                    .next().on(ace.click_event, function () {
                        $(this).prev().focus();
                    });

            });
		</script>

    <!-- the following scripts are used in demo only for onpage help and you don't need them -->
    <link rel="stylesheet" href="../assets/css/ace.onpage-help.css" />
    <link rel="stylesheet" href="../docs/assets/js/themes/sunburst.css" />

    <script type="text/javascript"> ace.vars['base'] = '..'; </script>
    <script src="../assets/js/ace/elements.onpage-help.js"></script>
    <script src="../assets/js/ace/ace.onpage-help.js"></script>
    <script src="../docs/assets/js/rainbow.js"></script>
    <script src="../docs/assets/js/language/generic.js"></script>
    <script src="../docs/assets/js/language/html.js"></script>
    <script src="../docs/assets/js/language/css.js"></script>
    <script src="../docs/assets/js/language/javascript.js"></script>
    <script src="../assets/js/bootbox.js"></script>
   
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


            function fnReportLogs() {

                var dateStart = document.getElementById('dateStart').value;
                var dateEnd = document.getElementById('dateEnd').value;

                var data = $.param({
                    Command: 'ReportLogs',
                    dateStart: dateStart,
                    dateEnd: dateEnd
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
            
                $tmp_scope = $scope;
                $tmp_http = $http;

                var ID = getParamValue("ID");
                loadData($scope, $http, ID);

            }
 
            function loadData($scope, $http, ID) {

                //var data = $.param({
                //    Command: 'LoadDataWaterMask',
                //    ID: ID
                //});

                //$http.post("../server/Server_User.aspx", data, config)
                //    .success(function (data, status, headers, config) {
                //        if (data.output == "OK") {


                //            fnUnLoading();

                //        } else {
                //            showmessage(data.MSG);
                //        }
                //    })
                //    .error(function (data, status, header, config) { });

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
