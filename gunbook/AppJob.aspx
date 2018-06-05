<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AppJob.aspx.cs" Inherits="gunbook_AppJob" %>

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


    <!-- inline styles related to this page -->

    <!-- ace settings handler -->
    <script src="../assets/js/ace-extra.js"></script>
 
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

</head>
<body style="background-color: white">
    <div class="container">
        <div class="row">
            <form id="form1" runat="server">
                <div id="mainApp" ng-app="myApp" ng-controller="StartApp">
                    <div class="widget-box transparent" id="widget-box-2">
                        <div class="row">
                            <div class="col-xs-12">
                                <div>
                                    <div class="error-container">
                                        <div class="well">
                                            <table style="width: 100%">
                                                <tr>
                                                    <td style="width: 20px"></td>
                                                    <td class="text-right">
                                                        <label>ชื่อ</label></td>
                                                    <td style="width: 5px"></td>
                                                    <td>
                                                        <input type="text" id="name" placeholder="ชื่อ" style="width: 100%" /></td>
                                                    <td style="width: 20px"></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="5" style="height: 5px"></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 20px"></td>
                                                    <td class="text-right">
                                                        <label>อายุ</label></td>
                                                    <td style="width: 5px"></td>
                                                    <td>
                                                        <input type="text" id="age" placeholder="อายุ" style="width: 100%" /></td>
                                                    <td style="width: 20px"></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="5" style="height: 5px"></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 20px"></td>
                                                    <td class="text-right">
                                                        <label>ตำแหน่ง</label></td>
                                                    <td style="width: 5px"></td>
                                                    <td>
                                                        <input type="text" id="position" placeholder="ตำแหน่ง" style="width: 100%" /></td>
                                                    <td style="width: 20px"></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="5" style="height: 5px"></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 20px"></td>
                                                    <td class="text-right">
                                                        <label>เงินเดือน</label></td>
                                                    <td style="width: 5px"></td>
                                                    <td>
                                                        <input type="text" id="salary" placeholder="เงินเดือน" style="width: 100%" /></td>
                                                    <td style="width: 20px"></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="5" style="height: 5px"></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 20px"></td>
                                                    <td class="text-right">
                                                        <label>เบอร์โทร</label></td>
                                                    <td style="width: 5px"></td>
                                                    <td>
                                                        <input type="text" id="tel" placeholder="เบอร์โทร" style="width: 100%" /></td>
                                                    <td style="width: 10px"></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr />
                        <div class="widget-body">
                            <div class="row" style="margin: 5px 15px 0px 0px">
                                <div class="col-sm-12 text-right" style="padding: 0px;">
                                    <a class="btn btn-success btn-xs" data-toggle="modal" data-target="#myModalAddRecord" ng-click="clearId()">
                                        <i class="ace-icon fa fa-plus bigger-110"></i>เพิ่มประวัติการทำงาน
                                    </a>

                                </div>
                            </div>
                            <br />
                            <div class="row" style="margin: 0px 15px 0px 15px;">
                                <div class="col-xs-12" style="overflow-x: scroll; padding-left: 0px; padding-right: 0px;">
                                    <table id="simple-table" class="table table-bordered table-hover">
                                        <thead>
                                            <tr style="background: #eeeeee;">
                                                <%--   <th class="text-center">&nbsp;</th>--%>
                                                <th class="text-center">&nbsp;</th>
                                                <th class="text-center">&nbsp;</th>
                                                <th class="text-center">บริษัท&nbsp;</th>
                                                <th class="text-center">วันที่เริ่มทำงาน&nbsp;</th>
                                                <th class="text-center">วันที่ออกทำงาน</th>
                                                <th class="text-center">ตำแหน่ง&nbsp;</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr ng-repeat="item in DataRecords">

                                                <td class="text-center" nowrap>
                                                    <span class="glyphicon glyphicon-trash" ng-click="addDelRow($index)" style="color: #a95553; font-size: 16px;"></span>
                                                </td>
                                                <td class="text-center" nowrap>
                                                    <span class="glyphicon glyphicon-edit" data-toggle="modal" data-target="#myModal" ng-click="editdata(item, $index)" style="color: #265691; font-size: 16px;"></span>
                                                </td>

                                                <td nowrap>{{ item.Company }}</td>
                                                <td nowrap>{{ item.WorkStart }}</td>
                                                <td nowrap>{{ item.EndStart }}</td>
                                                <td nowrap>{{ item.Position }}</td>

                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.span -->
                            </div>
                            <div class="row">
                                <label id="ERROR"  style="color: red"></label>
                            </div>
                        </div>
        
                    </div>
                    <div>
                        <hr />
                        <a class="btn btn-primary" ng-click="fnSave()" style="width: 49%">
                            <i class="ace-icon fa fa-floppy-o align-top bigger-125"></i>
                            บันทึก
                        </a>
                        <a class="btn btn-danger" onclick="fnClose()" style="width: 49%">
                            <i class="ace-icon fa fa-remove align-top bigger-125"></i>
                            ยกเลิก
                        </a>
                    </div>

                    <div class="modal fade bootstrap-dialog" id="myModalAddRecord" role="dialog">
                        <div class="vertical-alignment-helper">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">

                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                        <button type="button" class="close"
                                            data-dismiss="modal">
                                            <span aria-hidden="true">&times;</span>
                                            <span class="sr-only">Close</span>
                                        </button>
                                        <h4 class="modal-title">เพิ่มประวัติการทำงาน
                                        </h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class=" col-sm-6">
                                                <div class="form-group">
                                                    <div class="col-sm-2 col-xs-12">
                                                        <p class="text"><strong>บริษัท :</strong></p>
                                                    </div>
                                                    <div class="col-sm-10 col-xs-12">
                                                        <input type="text" class="form-control" ng-model="company" id="_company" style="width: 100%" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class=" col-sm-6">
                                                <div class="form-group">
                                                    <div class="col-sm-2 col-xs-12">
                                                        <p class="text"><strong>วันที่เริ่มทำงาน :</strong></p>
                                                    </div>
                                                    <div class="col-sm-10 col-xs-12">
      <input   type="text" class="form-control input-mask-date" placeholder="dd/mm/yyyy" ng-model="startDate"  id="_startDate" style="width: 100%"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class=" col-sm-6">
                                                <div class="form-group">
                                                    <div class="col-sm-2 col-xs-12">
                                                        <p class="text"><strong>วันที่ออกทำงาน :</strong></p>
                                                    </div>
                                                    <div class="col-sm-10 col-xs-12">
                                                            <input   type="text" class="form-control input-mask-date" placeholder="dd/mm/yyyy" ng-model="endDate"  id="_endDate" style="width: 100%"/>
 
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class=" col-sm-6">
                                                <div class="form-group">
                                                    <div class="col-sm-2 col-xs-12">
                                                        <p class="text"><strong>ตำแหน่ง :</strong></p>
                                                    </div>
                                                    <div class="col-sm-10 col-xs-12">
                                                        <input type="text" class="form-control" ng-model="position" id="_position" style="width: 100%" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="margin: 15px 0px 0px 0px">
                                            <div class="col-sm-12 text-right">


                                                <a class="btn btn-success btn-xs" ng-click="addRow()" >
                                                    <i class="ace-icon fa fa-save bigger-110"></i>เพิ่ม
                                                </a>
                                                <a class="btn btn-danger btn-xs" data-dismiss="modal">
                                                    <i class="ace-icon fa fa-close bigger-110"></i>ปิด
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                       <div class="modal  bootstrap-dialog " id="myModal" role="dialog" data-backdrop="static" data-keyboard="false">
                        <div class="modal-dialog modal-dialog">
                            <div class="modal-content modal-content-fullscreen" style="background-color: #eff3f8;">
                                <!-- Modal Header -->
                                <div class="modal-header" style="padding: 5px; border: 0px;">
                
                                    <h4 class="modal-title">{{titleModal}}
                                    </h4>
                                </div>
 
                                <div class="modal-body" style="background-color: white;">
                           
                                    <div class="row" ng-hide="boolmultirow">
                                        <div class=" col-sm-12" style="margin-bottom: 5px;">
                                            <div class="form-group">
                                                <div class="col-sm-5 col-xs-12">
                                                    <p class="text"><strong>บริษัท :</strong></p>
                                                </div>
                                                <div class="col-sm-7 col-xs-12">
                                                    <input type="text" id="eCompany" class="form-control" ng-model="RecordData.Company" style="width: 100%"  />
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-sm-12" style="margin-bottom: 5px;">
                                            <div class="form-group">
                                                <div class="col-sm-5 col-xs-12">
                                                    <p class="text"><strong>วันที่เริ่มทำงาน :</strong></p>
                                                </div>
                                                <div class="col-sm-7 col-xs-12">
                                                     <input id="eStartDate"  type="text" class="form-control input-mask-date" placeholder="dd/mm/yyyy"  ng-model="RecordData.WorkStart" style="width: 100%"/>
                                                </div>
                                            </div>
                                        </div>
                                              <div class=" col-sm-12" style="margin-bottom: 5px;">
                                            <div class="form-group">
                                                <div class="col-sm-5 col-xs-12">
                                                    <p class="text"><strong>วันที่ออกทำงาน :</strong></p>
                                                </div>
                                                <div class="col-sm-7 col-xs-12">
                                                     <input id="eEndDate"  type="text" class="form-control input-mask-date" placeholder="dd/mm/yyyy"  ng-model="RecordData.EndStart" style="width: 100%"/>
                                                  
                                                </div>
                                            </div>
                                        </div>
                                              <div class=" col-sm-12" style="margin-bottom: 5px;">
                                            <div class="form-group">
                                                <div class="col-sm-5 col-xs-12">
                                                    <p class="text"><strong>ตำแหน่ง :</strong></p>
                                                </div>
                                                <div class="col-sm-7 col-xs-12">
                                                    <input type="text"  id="ePosition"  class="form-control" ng-model="RecordData.Position" style="width: 100%" "/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer" style="border: 0px;">
                                    <div class="row">
                                          <div class="col-sm-10 text-right">
 
                                        </div>
                                        <div class="col-sm-2 text-right">
                                            <a class="btn btn-success btn-xs"    ng-click="adddata()">
                                                <i class="ace-icon fa fa-save bigger-110"></i>บันทึก
                                            </a>
                                                <a class="btn btn-danger btn-xs" data-dismiss="modal" >
                                                    <i class="ace-icon fa fa-close bigger-110"></i>ยกเลิก
                                                </a>
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
    <!-- basic scripts -->

    <!--[if !IE]> -->
    <script src="../assets/js/jquery.js"></script>
    <script src="../assets/js/dataTables/jquery.dataTables.js"></script>
    <!-- <![endif]-->
    <!--[if IE]>
        <script src="../assets/js/jquery1x.js"></script>
        <![endif]-->
    <script type="text/javascript">
        if ('ontouchstart' in document.documentElement) document.write("<script src='../assets/js/jquery.mobile.custom.js'>" + "<" + "/script>");
    </script>
    <script src="../assets/js/bootstrap.js"></script>

    <!-- page specific plugin scripts -->
        <script src="../assets/js/jquery.maskedinput.js"></script>
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
    <link href="../assets/css/jquery.dataTables.min.css" rel="stylesheet" />

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

        function myFunction() {
            var input, filter, ul, li, a, i;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            ul = document.getElementById("myUL");
            li = ul.getElementsByTagName("li");
            for (i = 0; i < li.length; i++) {
                a = li[i].getElementsByTagName("a")[0];
                if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
                    li[i].style.display = "";
                } else {
                    li[i].style.display = "none";
                }
            }
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

        //=============== add multiple rows IE Support=========
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

        function StartApp($scope, $http, $filter) {
            fnLoading();
            var ID = getParamValue("ID");

            if (ID != null) {
                loadData($scope, $http, ID);
                fnUnLoading();
            } else {
                var arr = [];
                $scope.DataRecords = arr;
                fnUnLoading();
            }
            
  
            $tmp_scope = $scope;
            $tmp_http = $http;

            $scope.titleModal = '';
            $scope.booledit = false;
            $scope.boolmultirow = false;
            $scope.idx = '';


            $scope.clearRow = function () {

                $scope.RecordData = {
                    Company: '',
                    WorkStart: '',
                    EndStart: '',
                    Position: ''
                };
                document.getElementById('_company').value = "";
                document.getElementById('_startDate').value = "";
                document.getElementById('_endDate').value = "";
                document.getElementById('_position').value = "";



            }
            $scope.startid = "";
            $scope.endid = "";

            $scope.clearId = function () {
                $scope.startid = "";
                $scope.endid = "";
                $scope.prefix_tmp = "";
                $scope.postfix_tmp = "";
            };



            $scope.addRow = function () {
                var company = String($scope.company);
                var startDate = document.getElementById('_startDate').value;
                var endDate = document.getElementById('_endDate').value;
                var position = String($scope.position);
             
                if (company == "undefined") { alert('โปรดระบุชื่อบริษัท'); return; }
                if (startDate == "") { alert('โปรดระบุวันที่เริ่มทำงาน'); return; }
                if (startDate == "") { alert('โปรดระบุวันที่ออกทำงาน'); return; }
                if (position == "undefined") { alert('โปรดระบุชื่อตำแหน่ง'); return;}
              
                $scope.clearRow();

                $scope.RecordData.Company = company;
                $scope.RecordData.WorkStart = startDate;
                $scope.RecordData.EndStart = endDate;
                $scope.RecordData.Position = position;

                $scope.DataRecords.push($scope.RecordData);

                $('#myModalAddRecord').modal('hide');


            };

            $scope.addDelRow = function (index) {
                $scope.DataRecords.splice(index, 1);
            };

            $scope.editdata = function (item, idx) {
                $scope.titleModal = 'แก้ไขข้อมูล'
                $scope.booledit = true;
                $scope.boolmultirow = false;
                $scope.RecordData = item;
                $("input[type='checkbox']:checked").prop('checked', false);
                $scope.idx = idx;
            };

            $scope.adddata = function () {

                var company = document.getElementById('eCompany').value;
                var startDate = document.getElementById('eStartDate').value;
                var endDate = document.getElementById('eEndDate').value;
                var position = document.getElementById('ePosition').value;

                if (company == "") { alert('โปรดระบุชื่อบริษัท'); return; }
                if (startDate == "") { alert('โปรดระบุวันที่เริ่มทำงาน'); return; }
                if (startDate == "") { alert('โปรดระบุวันที่ออกทำงาน'); return; }
                if (position == "") { alert('โปรดระบุชื่อตำแหน่ง'); return; }
 
                try {
                    var d = new Date();
                    var strDate = formatDate(d)

                    if ($scope.booledit == true) {

                        $scope.RecordData.WorkStart = document.getElementById('eStartDate').value;
                        $scope.RecordData.EndStart = document.getElementById('eEndDate').value;
                    }

                    $('#myModal').modal('hide');
 
                }
                catch (err) {
                    alert(err.message);
                }
            };

            $scope.fnSave = function ()
            {
                 var itemsExp = (document.getElementById('simple-table').getElementsByTagName("tr").length) - 1;

                var name = document.getElementById('name').value;
                var age = document.getElementById('age').value;
                var position = document.getElementById('position').value;
                var salary = document.getElementById('salary').value;
                var tel = document.getElementById('tel').value;

                fnLoading();
                var data = $.param({
                    Command: 'SaveAppJob',
                    ID: getParamValue("ID"),
                    name: name,
                    age: age,
                    position: position,
                    salary: salary,
                    tel: tel,
                    itemExp: itemsExp,
                    record: JSON.stringify($scope.DataRecords)
                });

                $http.post("../server/Server_Gunbook.aspx", data, config)
                    .success(function (data, status, headers, config) {
                        if (data.output == 'OK') {
                            fnUnLoading();
                            window.parent.refreshAllData();

                        } else {
                            ERROR.innerHTML = data.MSG;
                            fnUnLoading();
                        }
                    })
                    .error(function (data, status, header, config) { });
            }


            $scope.$on('ngRepeatFinished', function (ngRepeatFinishedEvent) {
                $('#example').DataTable();
            });

            $scope.checkIfEnterKeyWasPressed = function ($event) {
                var keyCode = $event.which || $event.keyCode;
                if (keyCode === 13) {
                    $scope.adddata();
                    $scope.fnSave("0");
                    return;
                }
            };
        }

        function loadData($scope, $http, ID) {


            var data = $.param({
                Command: 'LoadDataAppJob',
                ID: ID
            });

            $http.post("../server/Server_Gunbook.aspx", data, config)
                .success(function (data, status, headers, config) {
                    if (data.output == "OK") {

                        document.getElementById('name').value = data.NAME;
                        document.getElementById('age').value = data.AGE;
                        document.getElementById('position').value = data.POSITION;
                        document.getElementById('salary').value = data.SALARY;
                        document.getElementById('tel').value = data.TEL;
                         $scope.DataRecords = data.DATARECORDS;

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


        function checkboxClick(item) {
            var $box = $(item);

            if ($box.is(':checked')) {
                // the name of the box is retrieved using the .attr() method
                // as it is assumed and expected to be immutable
                var group = 'input:checkbox[name="' + $box.attr('name') + '"]';
                // the checked state of the group/box on the other hand will change
                // and the current value is retrieved using .prop() method
                $(group).prop('checked', false);
                $box.prop('checked', true);
            } else {
                $box.prop('checked', false);
            }
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
        <script type="text/javascript">
            jQuery(function ($) {
                $('.input-mask-date').mask('99/99/9999');

            });

    </script>
</body>
</html>
