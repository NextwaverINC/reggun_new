<%@ Page Title="" Language="C#" MasterPageFile="~/master/main.master" AutoEventWireup="true" CodeFile="management.aspx.cs" Inherits="page_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .modal-dialog-fullscreen {
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
        }

        .modal-content-fullscreen {
            height: 100%;
            min-height: 100%;
            border-radius: 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- PAGE CONTENT BEGINS -->
    <!--<iframe id="frmMain" style="position:static; width:98%; height: 100%;  border:none;" src="management_detail.html" ></iframe>-->
    <div id="mainApp">
        <h4 class="pink">
            <i class="ace-icon fa fa-hand-o-right icon-animated-hand-pointer blue"></i>
            <a href="#modal-table" role="button" class="green" data-toggle="modal">{{ TITLE }}</a>
            <table align="right" id="tblGrp" style="display: none">
                <tr>
                    <td>
                        <label id="grpName">เลขหนังสือ</label></td>
                    <td style="width: 10px"><font size="4" color="navy">:</font></td>
                    <td>
                        <select class="form-control" id="cbxGRP" style="min-width: 100px" onchange="fnGrpChange()">
                            <option ng-value="x.VALUE" ng-repeat="x in GROUP" ng-selected="x.VALUE==x.VAL">{{x.TITLE}}</option>
                        </select>
                    </td>
                </tr>
            </table>
        </h4>
        <div class="row">
            <div class="col-lg-12">
                <div class="widget-box widget-color-blue" id="widget-box-9">
                    <div class="widget-header">
                        <h5 class="widget-title">ตัวกรองข้อมูล</h5>
                        <div class="widget-toolbar">
                            <a href="#" data-action="collapse">
                                <i class="1 ace-icon fa fa-chevron-up bigger-125"></i>
                            </a>
                        </div>
                    </div>
                    <div class="widget-body">
                        <div class="widget-main" style="padding:0px">
                            <div class="widget-box transparent" id="widget-box-12">
								<div class="widget-header" style="margin:0px">
									<!-- #section:custom/widget-box.tabbed -->
									<div class="widget-toolbar no-border">
										<ul class="nav nav-tabs" id="myTab">
											<li class="active">
												<a data-toggle="tab" href="#tabpage1">กรองข้อมูลทั่วไป</a>
											</li>

											<li>
												<a data-toggle="tab" href="#tabpage2">กรองข้อมูลขั้นสูง</a>
											</li>
										</ul>
									</div>
									<!-- /section:custom/widget-box.tabbed -->
								</div>

								<div class="widget-body">
									<div class="widget-main" style="padding:0px">
										<div class="tab-content">
											<div id="tabpage1" class="tab-pane in active">
                                                <table style="width:100%">
                                                    <tr>
                                                        <td>
                                                            <table style="width:100%">
                                                                <tr>
                                                                    <td style="text-align:right"><label ng-show="NSEARCH_COUNT >= 1">{{ NT1 }}</label>&nbsp;</td>                                                                    
                                                                    <td><input type="text" id="NST01" placeholder="โปรดระบุ" class="form-control" ng-show="NSEARCH_COUNT >= 1" ng-value="NV1"/></td>
                                                                    <td style="width:10px"></td>
                                                                    <td style="text-align:right"><label ng-show="NSEARCH_COUNT >= 2">{{ NT2 }}</label>&nbsp;</td>
                                                                    <td><input type="text" id="NST02" placeholder="โปรดระบุ" class="form-control" ng-show="NSEARCH_COUNT >= 2" ng-value="NV2"/></td>
                                                                    <td style="width:10px"></td>
                                                                    <td style="text-align:right"><label ng-show="NSEARCH_COUNT >= 3">{{ NT3 }}</label>&nbsp;</td>
                                                                    <td><input type="text" id="NST03" placeholder="โปรดระบุ" class="form-control" ng-show="NSEARCH_COUNT >= 3" ng-value="NV3"/></td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align:right"><label ng-show="NSEARCH_COUNT >= 4">{{ NT4 }}</label>&nbsp;</td>                                                              
                                                                    <td><input type="text" id="NST04" placeholder="โปรดระบุ" class="form-control" ng-show="NSEARCH_COUNT >= 4" ng-value="NV4"/></td>
                                                                    <td style="width:10px"></td>
                                                                    <td style="text-align:right"><label ng-show="NSEARCH_COUNT >= 5">{{ NT5 }}</label>&nbsp;</td>
                                                                    <td><input type="text" id="NST05" placeholder="โปรดระบุ" class="form-control" ng-show="NSEARCH_COUNT >= 5" ng-value="NV5"/></td>
                                                                    <td style="width:10px"></td>
                                                                    <td style="text-align:right"><label ng-show="NSEARCH_COUNT >= 6">{{ NT6 }}</label>&nbsp;</td>
                                                                    <td><input type="text" id="NST06" placeholder="โปรดระบุ" class="form-control" ng-show="NSEARCH_COUNT >= 6" ng-value="NV6"/></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td style="width: 60px">
                                                            <button class="btn btn-app btn-success btn-sm" ng-click="fnManagementSearch()">
                                                                <i class="ace-icon fa fa-search bigger-200"></i>
                                                                ค้นหา
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </table>												
											</div>
											<div id="tabpage2" class="tab-pane">
												<table style="width: 100%">
                                                    <tr>
                                                        <td>
                                                            <table style="width: 100%">
                                                                <tr>
                                                                    <td></td>
                                                                    <td>
                                                                        <select class="form-control" id="SC01">
                                                                            <option value="">เลือกคอลัมภ์</option>
                                                                            <option ng-value="x.NAME" ng-selected="x.NAME==x.VAL1" ng-repeat="x in SEARCH">{{x.TITLE}}</option>
                                                                        </select>
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" id="ST01" placeholder="โปรดระบุ" class="form-control" />
                                                                    </td>
                                                                    <td style="width: 50px; text-align: center">and</td>
                                                                    <td>
                                                                        <select class="form-control" id="SC02">
                                                                            <option value="">เลือกคอลัมภ์</option>
                                                                            <option ng-value="x.NAME" ng-selected="x.NAME==x.VAL2" ng-sle ng-repeat="x in SEARCH">{{x.TITLE}}</option>
                                                                        </select>
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" id="ST02" placeholder="โปรดระบุ" class="form-control" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 50px; text-align: center">and</td>
                                                                    <td>
                                                                        <select class="form-control" id="SC03">
                                                                            <option value="">เลือกคอลัมภ์</option>
                                                                            <option ng-value="x.NAME" ng-selected="x.NAME==x.VAL3" ng-repeat="x in SEARCH">{{x.TITLE}}</option>
                                                                        </select>
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" id="ST03" placeholder="โปรดระบุ" class="form-control" />
                                                                    </td>
                                                                    <td style="width: 50px; text-align: center">and</td>
                                                                    <td>
                                                                        <select class="form-control" id="SC04">
                                                                            <option value="">เลือกคอลัมภ์</option>
                                                                            <option ng-value="x.NAME" ng-selected="x.NAME==x.VAL4" ng-repeat="x in SEARCH">{{x.TITLE}}</option>
                                                                        </select>
                                                                    </td>

                                                                    <td>
                                                                        <input type="text" id="ST04" placeholder="โปรดระบุ" class="form-control" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td style="width: 60px">
                                                            <button class="btn btn-app btn-success btn-sm" ng-click="fnManagementSearch()">
                                                                <i class="ace-icon fa fa-search bigger-200"></i>
                                                                ค้นหา
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </table>
											</div>
										</div>
									</div>
								</div>
							</div>                            
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-12">
                <div class="widget-box widget-color-blue">
                    <div style="margin-bottom: 3px; background-color: #428bca">
                        <button class="btn btn-primary" ng-attr-id="{{ 'tool-' + x.INDEX }}" ng-repeat="x in TOOLS" ng-click="fnClick(x.COFNAME,x.TID,x.CLICK)" title="{{ x.TOOLTIP }}">
                            <i ng-class="x.IMAGE"></i>
                            {{ x.TEXT }}
                        </button>
                    </div>
                    <div>
                        <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr style="width: 100%">
                                    <th class="center">
                                        <%--<label class="pos-rel" >
									    <input type="checkbox" class="ace" id="chbHeader" />
									    <span class="lbl"></span>
								    </label>--%>
                                    </th>
                                    <th ng-repeat="y in COLUMN" ng-class="y.CLASS">{{ y.TEXT }}</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr ng-repeat="x in DATA" style="width: 100%">
                                    <td class="center">
                                        <label class="pos-rel">
                                            <input type="checkbox" class="ace" ng-attr-id="{{ 'row-' + x.RowID }}" />
                                            <span class="lbl"></span>
                                        </label>
                                    </td>
                                    <td ng-class="y.CLASS" ng-repeat="y in x.COLUMN">
                                        <span ng-class="y.CLASSSTATUS">{{ y.VALUE }}</span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
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

    <div class="modal fade" id="myModalFull" role="dialog" data-backdrop="static" data-keyboard="false" style="padding: 0px !important;">
        <div id="modaldialogFull" class="modal-dialog modal-dialog-fullscreen">
            <!-- Modal content-->
            <div class="modal-content modal-content-fullscreen">
                <div class="modal-header" style="display: none;">
                    <button id="btnClosefull" type="button" class="close" data-dismiss="modal" style="display: none;">&times;</button>
                    <h4 class="modal-title">
                        <label id="popHeaderFull"></label>
                    </h4>
                </div>
                <div class="modal-body" style="height: 100%;">
                    <iframe id="frmPopupFull" style="width: 100%; height: 100%; border-radius: 0; border: none; padding: 0px;"></iframe>
                </div>
            </div>
        </div>
    </div>

    <button id="btnFull" type="button" style="display: none" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModalFull">Open ModalFull</button>

    <button id="btnTest" type="button" style="display: none" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>

    <div class="modal fade" id="myModal" role="dialog">
        <div id="modaldialog" class="modal-dialog modal-lg">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button id="btnClose" type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">
                        <label id="popHeader"></label>
                    </h4>
                </div>
                <div class="modal-body">
                    <iframe id="frmPopup" style="width: 100%; height: 300px; border: none"></iframe>
                </div>
                <!-- 
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>
          -->
            </div>
        </div>
    </div>

    <!-- PAGE CONTENT ENDS -->

    <script src="command.js"></script>
    <script>   
        function fnLoading() {
            document.getElementById("mainApp").style.display = "none";
            document.getElementById("loading").style.display = "";
        }
        function fnUnLoading() {
            document.getElementById("mainApp").style.display = "";
            document.getElementById("loading").style.display = "none";
        }
        function getSelectRows() {
            var arTmp = new Array();
            for (var i = 0; i < $scope_gobal.DATA.length; i++) {
                try {
                    if (document.getElementById('row-' + $scope_gobal.DATA[i].RowID).checked) {
                        arTmp.push($scope_gobal.DATA[i]);
                    }
                } catch (err) { }
            }
            return arTmp;
        }
        function getCurrentValue(SelectRows, ColumnName) {
            if (SelectRows == null) {
                showmessage("โปรดเลือกรายการที่จะทำการแก้ไข");
                return "";
            }
            if (SelectRows.length == 0) {
                showmessage("โปรดเลือกรายการที่จะทำการแก้ไข");
                return "";
            }
            if (SelectRows.length > 1) {
                showmessage("ไม่สามารถแก้ไขรายการพร้อมกันหลายรายการได้");
                return "";
            }
            for (var i = 0; i < SelectRows[0].COLUMN.length; i++) {
                if (ColumnName == SelectRows[0].COLUMN[i].NAME) {
                    return SelectRows[0].COLUMN[i].VALUE;
                }
            }
            return "";
        }
        function closepopup() {
            document.getElementById("btnClose").click();
        }
        function closepopupfull() {
            document.getElementById("btnFull").click();
        }
        function showpopup(title, url, height, width) {
            document.getElementById('popHeader').innerHTML = '<font size="4px">' + title + '</font>';
            document.getElementById('frmPopup').src = url;

            if (height != undefined) document.getElementById('frmPopup').style.height = height + 'px';
            if (width != undefined) document.getElementById('modaldialog').style.width = width + 'px';

            /*
			if(type == '2'){
				document.getElementById('modaldialog').className = 'modal-dialog modal-sm';
			}else{
				document.getElementById('modaldialog').className = 'modal-dialog modal-lg';
			}*/

            document.getElementById('btnTest').click();
        }
        function showpopupFull(title, url) {
            document.getElementById('popHeaderFull').innerHTML = '<font size="4px">' + title + '</font>';
            document.getElementById('frmPopupFull').src = url;

            //if (height != undefined) document.getElementById('frmPopupFull').style.height = height + 'px';
            //if (width != undefined) document.getElementById('modaldialog').style.width = width + 'px';

            /*
			if(type == '2'){
				document.getElementById('modaldialog').className = 'modal-dialog modal-sm';
			}else{
				document.getElementById('modaldialog').className = 'modal-dialog modal-lg';
			}*/

            document.getElementById('btnFull').click();
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
        function showconfirm(msg, fun, parameter) {
            bootbox.confirm("<span class='bigger-125'>" + msg + "</span>", function (result) {
                if (result) {
                    fun(parameter);
                }
            });
        }
        function closemessage() {
            document.getElementById("alertClose").click();
        }
        //======================================================
        var $scope_gobal;
        var $http_gobal;
        var data_gobal;
        var column_gobal;
        var tmp_grp_id;
        function refreshAllData() {
            closepopup();
            window.location.reload();
        }
        function StartPages($scope, $http) {
            $scope.fnClick = function (COFNAME, TID, CLICK) { ToolClick(COFNAME, TID, CLICK); }
            $scope.fnManagementSearch = function () { searchManagement($scope, $http); }
            loadData($scope, $http);

            $scope_gobal = $scope;
            $http_gobal = $http;
        }
        function fnGrpChange() {
            searchManagement($scope_gobal, $http_gobal);
        }
        function searchManagement($scope, $http) {
            fnLoading();
            //myTable.columns().search('').draw();
            var SC01 = document.getElementById('SC01').value;
            var ST01 = document.getElementById("ST01").value;
            //if (SC01 != "") myTable.column(SC01).search(ST01, false, false).draw();           

            var SC02 = document.getElementById('SC02').value;
            var ST02 = document.getElementById("ST02").value;
            //if (SC02 != "") myTable.column(SC02).search(ST02, false, false).draw();           

            var SC03 = document.getElementById('SC03').value;
            var ST03 = document.getElementById("ST03").value;
            //if (SC03 != "") myTable.column(SC03).search(ST03, false, false).draw();

            var SC04 = document.getElementById('SC04').value;
            var ST04 = document.getElementById("ST04").value;
            //if (SC04 != "") myTable.column(SC04).search(ST04, false, false).draw();   
            var GRP_ID = document.getElementById('cbxGRP').value;

            document.getElementById('ST01').style.backgroundColor = "white";
            document.getElementById('ST02').style.backgroundColor = "white";
            document.getElementById('ST03').style.backgroundColor = "white";
            document.getElementById('ST04').style.backgroundColor = "white";

            var bNext = true;
            if (ST01 != "" && SC01 == "") {
                document.getElementById('ST01').style.backgroundColor = "yellow";
                bNext = false;
            }
            if (ST02 != "" && SC02 == "") {
                document.getElementById('ST02').style.backgroundColor = "yellow";
                bNext = false;
            }
            if (ST03 != "" && SC03 == "") {
                document.getElementById('ST03').style.backgroundColor = "yellow";
                bNext = false;
            }
            if (ST04 != "" && SC04 == "") {
                document.getElementById('ST04').style.backgroundColor = "yellow";
                bNext = false;
            }
            if (!bNext) {
                document.getElementById("cbxGRP").value = tmp_grp_id;
                showmessage("โปรดเลือก Column ที่เป็นเงื่อนไข");
                return;
            }
            
            var NSC01 = $scope.NFN1;
            var NSC02 = $scope.NFN2;
            var NSC03 = $scope.NFN3;
            var NSC04 = $scope.NFN4;
            var NSC05 = $scope.NFN5;
            var NSC06 = $scope.NFN6;

            var NST01 = document.getElementById("NST01").value;
            var NST02 = document.getElementById("NST02").value;
            var NST03 = document.getElementById("NST03").value;
            var NST04 = document.getElementById("NST04").value;
            var NST05 = document.getElementById("NST05").value;
            var NST06 = document.getElementById("NST06").value;
            
            var data = $.param({
                Command: 'SearchManagement',
                ConfigName: getParamValue("CFN"),
                MID: getParamValue("MID"),
                TID: getParamValue("TID"),
                GRP_ID: GRP_ID,
                SC01: SC01,
                ST01: ST01,
                SC02: SC02,
                ST02: ST02,
                SC03: SC03,
                ST03: ST03,
                SC04: SC04,
                ST05: ST04,
                NSC01:NSC01,
                NSC02:NSC02,
                NSC03:NSC03,
                NSC04:NSC04,
                NSC05:NSC05,
                NSC06:NSC06,
                NST01:NST01,
                NST02:NST02,
                NST03:NST03,
                NST04:NST04,
                NST05:NST05,
                NST06:NST06
            });

            $http.post("../server/Server.aspx", data, config)
                .success(function (data, status, headers, config) {
                    window.location.href = "management.aspx?ID="+getParamValue("ID")+"&MID=" + getParamValue("MID") + "&TID=" + getParamValue("TID") + "&SRD=" + data.SRD + "&CFN=" + getParamValue("CFN");
                })
                .error(function (data, status, header, config) { });
        }
        var numPageDisplay = 10;

        function loadData($scope, $http) {
            fnLoading();

            var data = $.param({
                Command: 'LoadManagement',
                ConfigName: getParamValue("CFN"),
                MID: getParamValue("MID"),
                TID: getParamValue("TID"),
                SRD: getParamValue("SRD")
            });

            $http.post("../server/server.aspx", data, config)
                .success(function (data, status, headers, config) {
                    $scope.COLUMN = data.columns;
                    $scope.DATA = data.records;
                    $scope.TOOLS = data.tools;
                    $scope.TITLE = data.title;
                    $scope.SEARCH = data.search;
                    $scope.NSEARCH_COUNT = parseInt(data.nsearch_count);
                    $scope.NFN1 = data.NFN1;
                    $scope.NFN2 = data.NFN2;
                    $scope.NFN3 = data.NFN3;
                    $scope.NFN4 = data.NFN4;
                    $scope.NFN5 = data.NFN5;
                    $scope.NFN6 = data.NFN6;
                    $scope.NT1 = data.NT1;
                    $scope.NT2 = data.NT2;
                    $scope.NT3 = data.NT3;
                    $scope.NT4 = data.NT4;
                    $scope.NT5 = data.NT5;
                    $scope.NT6 = data.NT6;
                    $scope.NV1 = data.NV1;
                    $scope.NV2 = data.NV2;
                    $scope.NV3 = data.NV3;
                    $scope.NV4 = data.NV4;
                    $scope.NV5 = data.NV5;
                    $scope.NV6 = data.NV6;


                    numPageDisplay = parseInt(data.pagedisplay)
                    if (data.group.length != 0) {
                        $scope.GROUP = data.group;
                        document.getElementById("grpName").innerHTML = '<font size="4" color="navy">' + data.group_txt + '</font>';
                        document.getElementById('tblGrp').style.display = "block";
                        tmp_grp_id = data.group_val;
                    }
                    if (data.ST1 != "") document.getElementById("ST01").value = data.ST1;
                    if (data.ST2 != "") document.getElementById("ST02").value = data.ST1;
                    if (data.ST3 != "") document.getElementById("ST03").value = data.ST1;
                    if (data.ST4 != "") document.getElementById("ST04").value = data.ST1;


                    window.setTimeout(initpage, 100);
                })
                .error(function (data, status, header, config) { });
        }

        var myTable;
        function refreshpage() {
            myTable.draw(true);

            return;
            try {
                myTable.draw(true);
                for (var i = 0; i < data_gobal.length; i++) {
                    //

                    myTable.row.add(data_gobal[i]);
                    /*
                    var datatmp = "0,";
                    for (var j = 0; j < column_gobal.length; j++) {
                        var columnname = column_gobal[j].COLUMNS;
                        var value = data_gobal[i][columnname];
                        if (datatmp == "")
                            data_gobal = "'" + value + "'";
                        else
                            data_gobal += ",'" + value + "'";
                    }
                    datatmp = "[" + datatmp + "]";
                    myTable.row.add(eval(datatmp));
                    */
                }

                myTable.draw(true);

            } catch (err) {
                alert(err);
            }


        }
        function initpage() {
            jQuery(function ($) {
                //initiate dataTables plugin
                myTable =
                    $('#dynamic-table')
                        //.wrap("<div class='dataTables_borderWrap' />")   //if you are applying horizontal scrolling (sScrollX)
                        .DataTable({
                            bAutoWidth: true,
                            //"aoColumns": [
                            //  { "bSortable": false },
                            //  null, null, null, null, null,
                            //  { "bSortable": false }
                            //],
                            "aaSorting": [],
                            "bFilter": false,
                            //"dom": '<"top"i>rt<"bottom"flp><"clear">',
                            "dom": '<"top"i>rt<"bottom"p>',
                            "bInfo": false,
                            "bProcessing": true,
                            //"bServerSide": true,
                            //"sAjaxSource": "http://127.0.0.1/table.php"	,
                            "pagingType": "full_numbers",
                            //"sScrollY": "200px",
                            //"bPaginate": false,

                            //"sScrollX": "100%",
                            //"sScrollXInner": "120%",
                            //"bScrollCollapse": true,
                            //Note: if you are applying horizontal scrolling (sScrollX) on a ".table-bordered"
                            //you may want to wrap the table inside a "div.dataTables_borderWrap" element

                            "iDisplayLength": numPageDisplay,

                            select: {
                                style: 'single'
                            }
                        });

                myTable.on('select', function (e, dt, type, index) {
                    if (type === 'row') {
                        $(myTable.row(index).node()).find('input:checkbox').prop('checked', true);
                    }
                });
                myTable.on('deselect', function (e, dt, type, index) {
                    if (type === 'row') {
                        $(myTable.row(index).node()).find('input:checkbox').prop('checked', false);
                    }
                });

                /////////////////////////////////
                //table checkboxes
                $('th input[type=checkbox], td input[type=checkbox]').prop('checked', false);

                //select/deselect all rows according to table header checkbox
                $('#dynamic-table > thead > tr > th input[type=checkbox], #dynamic-table_wrapper input[type=checkbox]').eq(0).on('click', function () {
                    var th_checked = this.checked;//checkbox inside "TH" table header

                    $('#dynamic-table').find('tbody > tr').each(function () {
                        var row = this;
                        if (th_checked) myTable.row(row).select();
                        else myTable.row(row).deselect();
                    });
                });

                //select/deselect a row when the checkbox is checked/unchecked
                $('#dynamic-table').on('click', 'td input[type=checkbox]', function () {
                    var row = $(this).closest('tr').get(0);
                    if (!this.checked) myTable.row(row).deselect();
                    else myTable.row(row).select();
                });


                $(document).on('click', '#dynamic-table .dropdown-toggle', function (e) {
                    e.stopImmediatePropagation();
                    e.stopPropagation();
                    e.preventDefault();
                });



                //And for the first simple table, which doesn't have TableTools or dataTables
                //select/deselect all rows according to table header checkbox
                var active_class = 'active';
                $('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function () {
                    var th_checked = this.checked;//checkbox inside "TH" table header

                    $(this).closest('table').find('tbody > tr').each(function () {
                        var row = this;
                        if (th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
                        else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
                    });
                });

                //select/deselect a row when the checkbox is checked/unchecked
                $('#simple-table').on('click', 'td input[type=checkbox]', function () {
                    var $row = $(this).closest('tr');
                    if ($row.is('.detail-row ')) return;
                    if (this.checked) $row.addClass(active_class);
                    else $row.removeClass(active_class);
                });

                /********************************/
                //add tooltip for small view action buttons in dropdown menu
                $('[data-rel="tooltip"]').tooltip({ placement: tooltip_placement });

                //tooltip placement on right or left
                function tooltip_placement(context, source) {
                    var $source = $(source);
                    var $parent = $source.closest('table')
                    var off1 = $parent.offset();
                    var w1 = $parent.width();

                    var off2 = $source.offset();
                    //var w2 = $source.width();

                    if (parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2)) return 'right';
                    return 'left';
                }

                /***************/
                $('.show-details-btn').on('click', function (e) {
                    e.preventDefault();
                    $(this).closest('tr').next().toggleClass('open');
                    $(this).find(ace.vars['.icon']).toggleClass('fa-angle-double-down').toggleClass('fa-angle-double-up');
                });
                /***************/

                /**
                //add horizontal scrollbars to a simple table
                $('#simple-table').css({'width':'2000px', 'max-width': 'none'}).wrap('<div style="width: 1000px;" />').parent().ace_scroll(
                  {
                    horizontal: true,
                    styleClass: 'scroll-top scroll-dark scroll-visible',//show the scrollbars on top(default is bottom)
                    size: 2000,
                    mouseWheelLock: true
                  }
                ).css('padding-top', '12px');
                */
                try {
                    var OP = "" + getParamValue("OP");
                    if (OP == "1") {
                        document.getElementById('tool-0').click();
                    }    
                }catch(err){}
                fnUnLoading();      
            })
        }

        //===================================
        function base64ToArrayBuffer(base64) {
            var binaryString = window.atob(base64);
            var binaryLen = binaryString.length;
            var bytes = new Uint8Array(binaryLen);
            for (var i = 0; i < binaryLen; i++) {
                var ascii = binaryString.charCodeAt(i);
                bytes[i] = ascii;
            }
            return bytes;
        }

        function saveByteArray(reportName, byte) {
            var blob = new Blob([byte]);
            var link = document.createElement('a');
            link.href = window.URL.createObjectURL(blob);
            var fileName = reportName + ".pdf";
            link.download = fileName;
            link.click();
        }
    </script>
</asp:Content>

