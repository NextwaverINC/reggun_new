﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_type.aspx.cs" Inherits="users_user_type" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>Nestable lists - Ace Admin</title>

		<meta name="description" content="Drag &amp; drop hierarchical list" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="../assets/css/bootstrap.css" />
		<link rel="stylesheet" href="../assets/css/font-awesome.css" />

		<!-- page specific plugin styles -->

		<!-- text fonts -->
		<link rel="stylesheet" href="../assets/css/ace-fonts.css" />

		<!-- ace styles -->
		<link rel="stylesheet" href="../assets/css/ace.css" class="ace-main-stylesheet"  />

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
<body style="background-color:white">
    <form id="form1" runat="server">
        <div id="mainApp">
        <table align="center">
            <tr>
                <td><label id="ERROR" style="color:red"></label></td>
            </tr>
            <tr>
                <td>
                    <div ng-app="myApp" ng-controller="StartApp">
                        <div>
                            <table>
                                <tr>
                                    <td><label>รหัสกลุ่มผู้ใช้งาน</label></td>
                                    <td style="width:5px"></td>
                                    <td><input type="text" id="txbCode" placeholder="code" style="width:100px" readonly /></td>
                                    <td style="width:5px"></td>
                                    <td><label>ชื่อกลุ่มผู้ใช้งาน</label></td>
                                    <td style="width:5px"></td>
                                    <td><input type="text" id="txbName" placeholder="name" style="width:200px"  /></td>
                                    <td rowspan="3" style="width:5px"></td>
                                    <td rowspan="3" style="width:60px">
                                         <a class="btn btn-app btn-danger btn-sm" onclick="fnClear()">
									        <i class="ace-icon fa fa-refresh bigger-200"></i>
									        ล้าง
								        </a>
                                    </td>
                                    <td rowspan="3" style="width:60px">
                                         <a class="btn btn-app btn-info btn-sm" onclick="fnSave()">
									        <i class="ace-icon fa fa-save bigger-200"></i>
									        บันทึก
								        </a>
                                    </td>
                                    
                                </tr>
                                <tr>
                                    <td style="height:5px"></td>
                                </tr>
                                <tr>
                                    <td><label>หัวหน้า</label></td>
                                    <td style="width:5px"></td>
                                    <td colspan="5">
                                        <select id="parent" class="multiselect" style="width:100%">
                                            <option value="">-- ไม่มีหัวหน้า --</option>
											<option ng-value="x.CODE" ng-repeat="x in POSITION" ng-selected="{{ x.CHECK=='1' }}">
                                                {{ x.NAME }}
											</option>										
										</select>
                                    </td>                                    
                                </tr>
                                <tr>
                                    <td style="height:10px"></td>
                                </tr>
                                <tr>
                                    <td colspan="6"><label>สิทธิ์การใช้งาน</label></td>
                                </tr>
                            </table>
                        </div>
                        <div class="dd dd-draghandle" style="background-color:black;border:1px solid black;">
                            <ol class="dd-list">				
				                <li class="dd-item dd2-item" ng-repeat="x in MENU">
					                <div class="dd2-handle"><input type="checkbox" class="checkstyle" ng-attr-id="{{ 'chb-' + x.ID }}"  ng-checked="{{ x.CHECK==1 }}" onclick="fnCheckbox()"/></div>
					                <div class="dd2-content">{{ x.NAME }}<i ng-hide="x.SUBMENU.length==0" class="pull-right bigger-130 ace-icon fa fa-desktop info"></i></div>
					                <ol class="dd-list" ng-hide="x.SUBMENU.length==0">
					                    <li  class="dd-item dd2-item" ng-repeat="y in x.SUBMENU">
						                    <div class="dd2-handle"><input type="checkbox" class="checkstyle" ng-attr-id="{{ 'chb-' + y.ID }}" ng-checked="{{ y.CHECK==1 }}" /></div>
						                    <div class="dd2-content">{{ y.NAME }}<i ng-hide="''+y.SUBMENU==''" class="pull-right bigger-130 ace-icon fa fa-bookmark info"></i></div> 
                                            <ol class="dd-list">
					                            <li class="dd-item dd2-item" ng-repeat="z in y.SUBMENU">
						                            <div class="dd2-handle"><input type="checkbox" class="checkstyle" ng-attr-id="{{ 'chb-' + z.ID }}" ng-checked="{{ z.CHECK==1 }}" onclick="fnCheckboxSub('new')" /></div>
						                            <div class="dd2-content">{{ z.NAME }}</div>                            
					                            </li>
					                        </ol>                           
					                    </li>                       
					                </ol>
				                </li>
			                </ol>
		                </div>
                    </div>
                </td>
            </tr>
        </table>
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

		<!-- page specific plugin scripts -->
		<script src="../assets/js/jquery.nestable.js"></script>

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
        <script>
            var PARENT_CODE = "";
            function getParamValue(name) {
                var url = location.href;
                name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
                var regexS = "[\\?&]" + name + "=([^&#]*)";
                var regex = new RegExp(regexS);
                var results = regex.exec(url);
                return results == null ? null : results[1];
            }
            var status = "0";
            var subSt = "";
            function fnCheckbox() {
                if (document.getElementById('chb-' + 3).checked) {
                    if (document.getElementById('chb-1.0.2').checked) {
                        document.getElementById('chb-1.0.1').checked = true;
                        document.getElementById('chb-1.0.2').checked = false;
                        subSt = "startA";
                    }
                    if (document.getElementById('chb-' + 4).checked == false && document.getElementById('chb-' + 5).checked == false) {
                        document.getElementById('chb-' + 4).checked = false;
                        document.getElementById('chb-' + 5).checked = false;
                    }
                    else if (document.getElementById('chb-' + 4).checked == true) {

                        if (status == "startB") {
                            document.getElementById('chb-' + 3).checked = true;
                            document.getElementById('chb-' + 4).checked = false;
                            document.getElementById('chb-' + 5).checked = false;
                            status = "startA";
                        }
                        else if (status == "startC") {
                            document.getElementById('chb-' + 3).checked = false;
                            document.getElementById('chb-' + 4).checked = false;
                            document.getElementById('chb-' + 5).checked = true;
                            status = "startC";
                        }
                        else {
                            document.getElementById('chb-' + 3).checked = false;
                            document.getElementById('chb-' + 4).checked = true;
                            document.getElementById('chb-' + 5).checked = false;
                        }
                    }
                    else if (document.getElementById('chb-' + 5).checked == true) {
                        if (status == "startA") {
                            document.getElementById('chb-' + 3).checked = false;
                            document.getElementById('chb-' + 5).checked = true;
                            status = "startC";
                        }
                        else if (status == "startC") {
                            document.getElementById('chb-' + 3).checked = true;
                            document.getElementById('chb-' + 5).checked = false;
                            status = "startA";
                        }
                    }
                }
                if (document.getElementById('chb-' + 4).checked) {

                    if (document.getElementById('chb-1.0.1').checked) {
                        document.getElementById('chb-1.0.1').checked = false;
                        document.getElementById('chb-1.0.2').checked = true;
                        subSt = "startB";
                    }

                    if (document.getElementById('chb-' + 3).checked == false && document.getElementById('chb-' + 5).checked == false) {
                        document.getElementById('chb-' + 4).checked = true;
                        document.getElementById('chb-' + 3).checked = false;
                        status = "startB";
                    }
                    else if (document.getElementById('chb-' + 5).checked == true) {
                        if (status == "startC") {
                            document.getElementById('chb-' + 4).checked = true;
                            document.getElementById('chb-' + 5).checked = false;
                            status = "startB";
                        }
                        else if (status == "startB") {
                            document.getElementById('chb-' + 4).checked = false;
                            document.getElementById('chb-' + 5).checked = true;
                            status = "startC";
                        }
                    }
                }
                if (document.getElementById('chb-' + 5).checked) {
                    if (document.getElementById('chb-' + 3).checked == false && document.getElementById('chb-' + 4).checked == false) {
                        document.getElementById('chb-' + 4).checked = false;
                        document.getElementById('chb-' + 5).checked = true;
                        status = "startC";
                    } else if (document.getElementById('chb-' + 4).checked == true) {
                        if (document.getElementById('chb-' + 3).checked == false) {
                            document.getElementById('chb-' + 4).checked = true;
                            document.getElementById('chb-' + 5).checked = false;
                            status = "startB";
                        }
                    } else if (document.getElementById('chb-' + 3).checked == true) {
                        if (document.getElementById('chb-' + 3).checked == true) {
                            document.getElementById('chb-' + 4).checked = false;
                            document.getElementById('chb-' + 5).checked = false;
                            status = "startA";
                        }
                    }
                }

            }
            function fnCheckboxSub(_case) {
                if (_case == "defult") {

                    if (document.getElementById('chb-1.0.1').checked) {
                        subSt = "startA";
                    }
                    else if (document.getElementById('chb-1.0.2').checked) {
                        subSt = "startB";
                    }
                } else {

                    //----------------------Read & Edit Document -------------------------
                    if (document.getElementById('chb-1.0.1').checked && document.getElementById('chb-1.0.2').checked) {
                        if (subSt == "startA") {
                            document.getElementById('chb-1.0.1').checked = false;
                            document.getElementById('chb-1.0.2').checked = true;
                            document.getElementById('chb-3').checked = false;
                            document.getElementById('chb-4').checked = true;
                            subSt = "startB";
                        }
                        else if (subSt == "startB") {
                            document.getElementById('chb-1.0.1').checked = true;
                            document.getElementById('chb-1.0.2').checked = false;
                            document.getElementById('chb-3').checked = true;
                            document.getElementById('chb-4').checked = false;
                            subSt = "startA";
                        }

                    }
                    else if (document.getElementById('chb-1.0.1').checked) {
                        subSt = "startA";
                        document.getElementById('chb-1.0.1').checked = true;
                        document.getElementById('chb-1.0.2').checked = false;
                        document.getElementById('chb-3').checked = true;
                        document.getElementById('chb-4').checked = false;
                    }
                    else if (document.getElementById('chb-1.0.2').checked) {
                        subSt = "startB";
                        document.getElementById('chb-1.0.1').checked = false;
                        document.getElementById('chb-1.0.2').checked = true;
                        document.getElementById('chb-3').checked = false;
                        document.getElementById('chb-4').checked = true;
                    }
                }
            }

            function fnSave() {

                fnLoading();

                var Name = document.getElementById('txbName').value;
                var parent = document.getElementById('parent').value;
              
                var ERROR = document.getElementById('ERROR');
                var tmpID = getParamValue("ID");
                ERROR.innerHTML = "";
                if (Name == "") {
                    ERROR.innerHTML = "โปรดระบุชื่อตำแหน่ง";
                    fnUnLoading();
                    return;
                }

                var SID = "";
                for (var i = 0; i < $tmp_scope.MENU.length; i++) {
                    var M_ID = $tmp_scope.MENU[i].ID;

                    var SUBMENU = $tmp_scope.MENU[i].SUBMENU;
                    if (document.getElementById('chb-' + M_ID).checked) {
                        if (SID == "") SID = M_ID;
                        else SID += "," + M_ID;
                    }

                    if (SUBMENU != null) {
                        for (var j = 0; j < SUBMENU.length; j++) {
                            var SUB_SUBMENU = SUBMENU[j].SUBMENU;
                            var S_ID = SUBMENU[j].ID;

                            if (document.getElementById('chb-' + S_ID).checked) {
                                if (SID == "") SID = S_ID;
                                else SID += "," + S_ID;
                            }

                            if (SUB_SUBMENU != null) {
                                for (var z = 0; z < SUB_SUBMENU.length; z++) {
                                    var SS_ID = SUB_SUBMENU[z].ID;
                                    if (document.getElementById('chb-' + SS_ID).checked) {
                                        if (SID == "") SID = SS_ID;
                                        else SID += "," + SS_ID;
                                    }
                                }
                            }
                        }
                    }
                }

                var data = $.param({
                    Command: 'SavePosition',                   
                    Name: Name,
                    parent :parent,
                    ID_List: SID,
                    ID: tmpID
                });
              
                $tmp_http.post("../server/Server_User.aspx", data, config)
                    .success(function (data, status, headers, config) {  
                        fnUnLoading();
                        if (data.output == 'OK') {
                            window.parent.refreshAllData();
                        } else {
                            ERROR.innerHTML = data.MSG;
                        }
                    })
                .error(function (data, status, header, config) { });
            }
            function fnClear() {
                var txbCode = document.getElementById('txbCode');
                var txbName = document.getElementById('txbName');
                var parent = document.getElementById('parent');
                txbName.value = "";
                parent.value = "";

                for (var i = 0; i < $tmp_scope.MENU.length; i++) {
                    var M_ID = $tmp_scope.MENU[i].ID;
                  
                    var SUBMENU = $tmp_scope.MENU[i].SUBMENU;
                    document.getElementById('chb-' + M_ID).checked = false;
                    
                    if (SUBMENU != null) {
                        for (var j = 0; j < SUBMENU.length; j++) {
                            var SUB_SUBMENU = SUBMENU[j].SUBMENU;
                            var S_ID = SUBMENU[j].ID;

                            document.getElementById('chb-' + S_ID).checked = false;

                            if (SUB_SUBMENU != null) {
                                for (var z = 0; z < SUB_SUBMENU.length; z++) {
                                    var SS_ID = SUB_SUBMENU[z].ID;
                                    document.getElementById('chb-' + SS_ID).checked = false;
                                }
                            }

                        }
                    }
                    
                }
            }
            //======================================================
            var app = angular.module('myApp', []);
            var config = { headers: { 'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;' } }
            app.controller('StartApp', StartApp);
            var $tmp_scope;
            var $tmp_http;
         
            function StartApp($scope, $http) {
                fnLoading();
                //$scope.fnClick = function (CFN, MID, TID, NAME) { window.parent.fnOpenManagement(CFN, MID, TID, NAME); }
                loadPosition($scope, $http);

                $tmp_scope = $scope;
                $tmp_http = $http;
            }
            function loadPosition($scope, $http) {

                var SID = getParamValue("ID");
                var data = $.param({
                    Command: 'LoadPosition',
                    ID: SID
                });

                $http.post("../server/Server_User.aspx", data, config)
                    .success(function (data, status, headers, config) {
                        $scope.POSITION = data.records;                     
                        window.setTimeout(loadMenu, 100);
                    })
                .error(function (data, status, header, config) { });

                
            }
            function loadMenu() {

                var SID = getParamValue("ID");
              
                var data = $.param({
                    Command: 'LoadMenu',
                    ID: SID
                });

                $tmp_http.post("../server/Server_User.aspx", data, config)
                    .success(function (data, status, headers, config) {
                        $tmp_scope.MENU = data.records;
                        var POSITION_CODE = data.POSITION_CODE;
                        var POSITION_NAME = data.POSITION_NAME;
                        PARENT_CODE = data.PARENT_CODE;

                        document.getElementById('txbName').value = POSITION_NAME;
                        document.getElementById('txbCode').value = POSITION_CODE;

                        window.setTimeout(loadsidebar, 100);
                    })
                .error(function (data, status, header, config) { });
            }

            function loadsidebar() {
                jQuery(function ($) {

                    $('.dd').nestable();

                
       //$('[data-rel="tooltip"]').tooltip();
                   
                });
                 fnCheckboxSub("defult");
                //fnCheckbox();
                fnUnLoading();
            }


            function fnLoading() {
                document.getElementById("mainApp").style.display = "none";
                document.getElementById("loading").style.display = "";
            }
            function fnUnLoading() {
                document.getElementById("mainApp").style.display = "";
                document.getElementById("loading").style.display = "none";
            }
        </script>
</body>
</html>
