﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="setDestroryBook.aspx.vb" Inherits="gunbook_addBook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>Gun register book</title>

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
    </style>
</head>
<body style="background-color: white">
    <form id="form1" runat="server">
        <div id="mainApp" ng-app="myApp" ng-controller="StartApp">

            <div class="widget-box transparent" id="widget-box-2">
                <!-- #section:custom/widget-box.options -->
<%--                <div class="widget-header">
                    <h5 class="widget-title bigger lighter">
                        <i class="ace-icon fa fa-book"></i>
                        ข้อมูลหนังสือทะเบียนอาวุธปืน
                    </h5>
                </div>--%>
                <!-- /section:custom/widget-box.options -->
                <div class="widget-body">
                    <table style="width: 100%">
                        <%--<tr>
                            <td colspan="5" style="height: 20px"></td>
                        </tr>--%>
       <tr>
                            <td style="width: 20px"></td>
                            <td class="text-right">
                                <label>เลขที่หนังสือ : </label>
                            </td>
                            <td style="width: 5px"></td>
                            <td>
                                <input type="number" id="bookno" placeholder="เลขที่หนังสือ" style="width: 100%" min="1" disabled /></td>
                            <td style="width: 20px"></td>
                        </tr>
                        <tr>
                            <td colspan="5" style="height: 5px"></td>
                        </tr>
                        <tr>
                            <td style="width: 20px"></td>
                            <td class="text-right">
                                <label>ปี : </label>
                            </td>
                            <td style="width: 5px"></td>
                            <td>
                                <input type="number" id="bookyear" placeholder="ปี พ.ศ." style="width: 100%" min="2490" disabled/></td>
                            <td style="width: 20px"></td>
                        </tr>
                        <tr>
                            <td colspan="5" style="height: 5px"></td>
                        </tr>
                        <tr>
                            <td style="width: 20px"></td>
                            <td class="text-right">
                                <label>คำนำหน้าเลขทะบียน : </label>
                            </td>
                            <td style="width: 5px"></td>
                            <td><input type="text" id="gunregidprefix" placeholder="คำนำหน้า" style="width: 100%" disabled/></td>
                            <td style="width: 20px"></td>
                        </tr>
                        <tr>
                            <td colspan="5" style="height: 5px"></td>
                        </tr>
                        <tr>
                            <td style="width: 20px"></td>
                            <td class="text-right">
                                <label>เลขทะเบียนเริ่มต้น : </label>
                            </td>
                            <td style="width: 5px"></td>
                            <td>
                                <input type="text" id="gunregidstart" placeholder="เลขทะเบียนเริ่มต้น" style="width: 100%" disabled/></td>
                            <td style="width: 20px"></td>
                        </tr>
                        <tr>
                            <td colspan="5" style="height: 5px"></td>
                        </tr>
                        <tr>
                            <td style="width: 20px"></td>
                            <td class="text-right">
                                <label>เลขทะเบียนสิ้นสุด : </label>
                            </td>
                            <td style="width: 5px"></td>
                            <td>
                                <input type="text" id="gunregidend" placeholder="เลขทะเบียนสิ้นสุด" style="width: 100%" disabled/></td>
                            <td style="width: 20px"></td>
                        </tr>
                        <tr>
                            <td colspan="5" style="height: 5px"></td>
                        </tr>
                        <tr>
                            <td style="width: 20px"></td>
                            <td class="text-right">
                                <label>ประเภทอาวุธปืน(สั้น/ยาว) : </label>
                            </td>
                            <td style="width: 5px"></td>
                            <td>
                                <input type="text" id="groupgun" placeholder="ประเภทอาวุธปืน" style="width: 100%" disabled/></td>
                            <td style="width: 20px"></td>
                        </tr>                        
                        <tr>
                            <td colspan="5" style="height: 5px"></td>
                        </tr>
                        <tr>
                            <td style="width: 20px"></td>
                            <td class="text-right">
                                <label>จำนวนหน้าทั้งหมด : </label>
                            </td>
                            <td style="width: 5px"></td>
                            <td>
                                <input type="number" id="pagetotal" placeholder="จำนวนหน้าทั้งหมด" style="width: 100%" min="1" disabled/></td>
                            <td style="width: 20px"></td>
                        </tr>
                        <tr>
                            <td colspan="5" style="height: 5px"></td>
                        </tr>

             <tr>
                               <td style="width: 20px"></td>
              
                            <td class="text-right">
                                <label style="background-color:yellow; color:red;">วันที่ทำลายเอกสาร : </label>
                            </td>
                            <td style="width: 5px"></td>
                            <td>
                                 <div class="input-group">
									  <input type="text"  class="form-control date-picker" id="destrory_date"  placeholder="วันที่ทำลายเอกสาร" data-date-format="dd/mm/yyyy" />
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
                <div>
                   <center>
                <label style="color: red">*กำหนดวันทำลายเอกสาร หลังจากวันที่บันทึกอย่างน้อย 15 วัน </label></center>
            </div>

            <div>
                
                <label id="ERROR" style="color: red"></label>
            </div>
 
            <div>
                <a class="btn btn-primary" onclick="fnSave()" style="width: 49%">
                    <i class="ace-icon fa fa-floppy-o align-top bigger-125"></i>
                    บันทึก
                </a>
                <a class="btn btn-danger" onclick="fnClose()" style="width: 49%">
                    <i class="ace-icon fa fa-remove align-top bigger-125"></i>
                    ยกเลิก
                </a>
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

    <!-- basic scripts -->

    <!--[if !IE]> -->
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
    <script src="../assets/js/ace/ace.js"></script>
    <script src="../assets/js/ace/ace.ajax-content.js"></script>
    <script src="../assets/js/ace/ace.touch-drag.js"></script>
    <script src="../assets/js/ace/ace.sidebar.js"></script>
    <script src="../assets/js/ace/ace.sidebar-scroll-1.js"></script>
    <script src="../assets/js/ace/ace.submenu-hover.js"></script>
    <script src="../assets/js/ace/ace.widget-box.js"></script>
    <script src="../assets/js/ace/ace.settings.js"></script>
    <script src="../assets/js/ace/ace.settings-rtl.js"></script>
    <script src="../assets/js/ace/ace.settings-skin.js"></script>
    <script src="../assets/js/ace/ace.widget-on-reload.js"></script>
    <script src="../assets/js/ace/ace.searchbox-autocomplete.js"></script>


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

            var test = "";

            var destrory_date = document.getElementById('destrory_date').value;
            ERROR.innerHTML = "";


           //-----------------Date start-------------------
            var today = new Date();
            today.setDate(today.getDate() + 15);

            var dd = today.getDate();
            var mm = today.getMonth() + 1; //January is 0!
            var yyyy = today.getFullYear();

            if (dd < 10) {
                dd = '0' + dd;
            }
            if (mm < 10) {
                mm = '0' + mm;
            }

            var today2 = new Date();
            today2.setDate(today2.getDate() + 16);
            var dd2 = today2.getDate();
            var mm2 = today2.getMonth() + 1; //January is 0!
            var yyyy2 = today2.getFullYear();

            if (dd2 < 10) {
                dd2 = '0' + dd2;
            }
            if (mm2 < 10) {
                mm2 = '0' + mm2;
            }
            //-----------------------------

            //if (destrory_date == "") {
            //    alert("กรุณากรอกวันที่ทำลายเอกสาร ตั้งแต่วันที่ : " + dd2 + '/' + mm2 + '/' + yyyy2);
            //    document.getElementById('destrory_date').value = dd2 + '/' + mm2 + '/' + yyyy2;
            //    return;
            //}
            try {
                var st = destrory_date;
                var pattern = /(\d{2})\/(\d{2})\/(\d{4})/;
                var dt = new Date(st.replace(pattern, '$3-$2-$1'));


                if (dt < today) {
                    alert("วันที่กำหนดน้อยกว่า 15 วัน หลังจากวันที่บันทึก เริ่มกำหนดได้ตั้งแต่วันที่ : " + dd2 + '/' + mm2 + '/' + yyyy2);
                    document.getElementById('destrory_date').value = dd2 + '/' + mm2 + '/' + yyyy2;
                    return;
                } else {

                }

            } catch (e) {
                alert(e);

            }
          
            var getID = getParamValue("ID");
            fnLoading();
            var data = $.param({
                Command: 'SaveBook',
                ID: getParamValue("ID"),
                old_bookno: tmp_book_no,
                bookno: tmp_bookNO,
                bookyear: tmp_bookYear,
                gunregidstart: tmp_gunRegidstart,
                gunregidend: tmp_gunRegidend,
                pagetotal: tmp_pageTotal,
                gunregidprefix: tmp_gunRegidprefix,
                groupgun: tmp_groupGun,
                old_pagetotal: tmp_pageTotal,
                expire_date: tmp_expire,
                destrory_date : destrory_date
            });

            $tmp_http.post("../server/Server_Gunbook.aspx", data, config)
                .success(function (data, status, headers, config) {
                    if (data.output == 'OK') {
                        window.parent.refreshAllData();
                        return;
                    } else {
                        ERROR.innerHTML = data.MSG;
                        fnUnLoading();
                    }
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
        function fnClose() {
            window.parent.closepopup();
        }
        //======================================================
        var app = angular.module('myApp', []);
        var config = { headers: { 'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;' } }
        app.controller('StartApp', StartApp);
        var $tmp_scope;
        var $tmp_http;
        var tmp_book_no;
   //     var tmp_pagetotal;

        var tmp_bookNO;
        var tmp_bookYear;
        var tmp_gunRegidstart;
        var tmp_gunRegidend;
        var tmp_pageTotal;
        var tmp_gunRegidprefix;
        var tmp_groupGun;
        var tmp_expire;

        function StartApp($scope, $http) {
            //$scope.fnClick = function (CFN, MID, TID, NAME) { window.parent.fnOpenManagement(CFN, MID, TID, NAME); }  
            fnLoading();

            $tmp_scope = $scope;
            $tmp_http = $http;

     //       $("#destrory_date").datepicker({ dateFormat: 'dd/mm/yy', }).datepicker("setDate", new Date().getDay + 15);

        //    document.getElementById('bookno').value = new Date().getDay + 15
 

            var ID = getParamValue("ID");
           
            if(ID!=null)
                loadData($scope, $http, ID);
            else
                fnUnLoading();

           
        }
        function loadData($scope, $http, ID) {
            var data = $.param({
                Command: 'LoadDataBook',
                ID: ID
            });

            $http.post("../server/Server_Gunbook.aspx", data, config)
                .success(function (data, status, headers, config) {
                    if (data.output == "OK") {

                        tmp_book_no = data.BOOKNO;
                         tmp_bookNO = data.BOOKNO;
                         tmp_bookYear = data.BOOKYEAR;
                         tmp_gunRegidstart = data.GUNREGIDSTART;
                         tmp_gunRegidend = data.GUNREGIDEND;
                         tmp_pageTotal = data.PAGETOTAL;
                         tmp_gunRegidprefix = data.GUNREGIDPREFIX;
                         tmp_groupGun = data.GROUPGUN;
                         tmp_expire = data.EXPIRE_DATE;


                         document.getElementById('bookno').value = data.BOOKNO;
                         document.getElementById('bookyear').value = data.BOOKYEAR;
                         document.getElementById('gunregidstart').value = data.GUNREGIDSTART;
                         document.getElementById('gunregidend').value = data.GUNREGIDEND;
                         document.getElementById('pagetotal').value = data.PAGETOTAL;
                         document.getElementById('gunregidprefix').value = data.GUNREGIDPREFIX;
                         document.getElementById('groupgun').value = data.GROUPGUN;

                         document.getElementById('destrory_date').value = data.DESTRORY_DATE;



/*
                         if (data.DESTRORY_DATE =="") {

                             var today = new Date();
                             today.setDate(today.getDate() + 15);

                             var dd = today.getDate();
                             var mm = today.getMonth() + 1; //January is 0!
                             var yyyy = today.getFullYear();

                             if (dd < 10) {
                                 dd = '0' + dd;
                             }
                             if (mm < 10) {
                                 mm = '0' + mm;
                             }


                             document.getElementById('destrory_date').value = dd + '/' + mm + '/' + yyyy;
                         }*/


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

        function checkDate()
        {
            var destrory_date = document.getElementById('destrory_date').value;

            if (destrory_date =="") {
           
            } else {
                var d = new Date();
                d.setDate(0);
          //      alert(d);
            }
       
        }

    </script>
</body>
</html>
