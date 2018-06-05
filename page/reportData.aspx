<%@ Page Title="" Language="C#" MasterPageFile="~/master/main.master" AutoEventWireup="true" CodeFile="reportData.aspx.cs" Inherits="master_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div id="mainApp">
        <div class="row">
            <div class="col-lg-12">
                <div class="row" style="margin: 0px">
                    <div class="col-md-6 col-sm-6 col-xs-6 align-left" style="padding-right: 0px;">
                        <label class="control-label no-padding-right text-right" style="font-weight: bold" for="datethai">วันที่ : </label>
                        <label id="datethai"></label>
                    </div>

                    <div class="col-md-6 col-sm-6 col-xs-6 align-right" style="padding-right: 0px;">
                        <label class="control-label no-padding-right text-right" style="font-weight: bold" for="user">โดย : </label>
                        <label id="userNM"></label>
                    </div>
                </div>
            </div>

            <div class="col-lg-12">
                <div class="widget-box widget-color-blue" id="widget-box-9">
                    <div class="widget-header">
                        <h5 class="widget-title">รายงานข้อมูลทั้งหมด</h5>
                        <div class="widget-toolbar">
                            <a href="#" data-action="collapse">
                                <i class="1 ace-icon fa fa-chevron-up bigger-125"></i>
                            </a>
                        </div>
                    </div>
                    <div class="widget-body">
                        <div class="widget-main">
                            <div class="row" style="margin: 0px">
                                <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0px;">
                                    <label class="control-label no-padding-right text-right" style="font-weight: bold" for="allBook">จำนวนเล่ม : </label>
                                    <label id="allBook"></label>
                                </div>

                                <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0px;">
                                    <label class="control-label no-padding-right text-right" style="font-weight: bold" for="allPage">จำนวนหน้า : </label>
                                    <label id="allPage"></label>
                                </div>

                                <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0px;">
                                    <label class="control-label no-padding-right text-right" style="font-weight: bold" for="allRecode">จำนวนรายการ : </label>
                                    <label id="allRecode"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-6">
                <div class="widget-box widget-color-blue">
                    <div class="widget-header">
                        <h5 class="widget-title">รายงานข้อมูลทั้งหมด ตามปี</h5>
                        <div class="widget-toolbar">
                            <a href="#" data-action="collapse">
                                <i class="1 ace-icon fa fa-chevron-up bigger-125"></i>
                            </a>
                        </div>
                    </div>
                    <div class="widget-body">
                        <div class="widget-main">
                            <table id="dynamic-tableA" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr style="width: 100%">
                                        <th class="text-center">ปี&nbsp;</th>
                                        <th class="text-center">จำนวนเล่ม&nbsp;</th>
                                        <th class="text-center">จำนวนหน้า&nbsp;</th>
                                        <th class="text-center">จำนวนรายการ&nbsp;</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr ng-repeat="item in DataByYear" style="width: 100%">
                                        <td nowrap>{{item.BookYear}}</td>
                                        <td nowrap>{{item.CountBook}}</td>
                                        <td nowrap>{{item.SumPage}}</td>
                                        <td nowrap>{{item.SumRecode}}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-6">
                <div class="widget-box widget-color-blue">
                    <div class="widget-header">
                        <h5 class="widget-title">รายงานข้อมูลทั้งหมด ตามเล่ม</h5>
                        <div class="widget-toolbar">
                            <a href="#" data-action="collapse">
                                <i class="1 ace-icon fa fa-chevron-up bigger-125"></i>
                            </a>
                        </div>
                    </div>
                    <div class="widget-body">
                        <div class="widget-main">
                            <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr style="width: 100%">
                                        <th class="text-center">เล่มที่&nbsp;</th>
                                        <th class="text-center">ปี&nbsp;</th>
                                        <th class="text-center">จำนวนหน้า&nbsp;</th>
                                        <th class="text-center">จำนวนรายการ&nbsp;</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr ng-repeat="item in DataByBook" style="width: 100%">
                                        <td nowrap>{{item.BookNo}}</td>
                                        <td nowrap>{{item.BookYear}}</td>
                                        <td nowrap>{{item.ImgTotal}}</td>
                                        <td nowrap>{{item.SumRecord}}</td>
                                    </tr>
                                </tbody>
                            </table>
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
    <script>
        function fnLoading() {
            document.getElementById("mainApp").style.display = "none";
            document.getElementById("loading").style.display = "";
        }
        function fnUnLoading() {
            document.getElementById("mainApp").style.display = "";
            document.getElementById("loading").style.display = "none";
        }

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
            var d = new Date();
            document.getElementById('datethai').innerHTML = GetDateThai(d);
            //document.getElementById('userNM').innerHTML = userName;

            $scope.fnLoadCountData = function () {

                fnLoading();
                var data = $.param({
                    Command: 'getCountData'
                });

                $http.post("../server/Server_Gunbook.aspx", data, config)
                    .success(function (data, status, headers, config) {

                        document.getElementById('userNM').innerHTML = data.USERNAME;
                        document.getElementById('allBook').innerHTML = data.COUNTBOOK;
                        document.getElementById('allPage').innerHTML = data.COUNTPAGE;
                        document.getElementById('allRecode').innerHTML = data.COUNTRECODE;

                        $scope.DataByYear = data.DATACOUNTBYYEAR;
                        $scope.DataByBook = data.DATACOUNTBYBOOK;

                        window.setTimeout(initpage, 100);
                        fnUnLoading();
                    })
                    .error(function (data, status, header, config) { fnUnLoading(); });


            }

            $scope.fnLoadCountData();
        }

        function GetDateThai(date) {
            var sYear = date.getFullYear();
            if (sYear < 2400)
                sYear = sYear + 543;
            var sMonth = date.getMonth();
            var strMonthTH;
            switch (sMonth) {
                case 0:
                    strMonthTH = "มกราคม";
                    break;
                case 1:
                    strMonthTH = "กุมภาพันธ์";
                    break;
                case 2:
                    strMonthTH = "มีนาคม";
                    break;
                case 3:
                    strMonthTH = "เมษายน";
                    break;
                case 4:
                    strMonthTH = "พฤษภาคม";
                    break;
                case 5:
                    strMonthTH = "มิถุนายน";
                    break;
                case 6:
                    strMonthTH = "กรกฎาคม";
                    break;
                case 7:
                    strMonthTH = "สิงหาคม";
                    break;
                case 8:
                    strMonthTH = "กันยายน";
                    break;
                case 9:
                    strMonthTH = "ตุลาคม";
                    break;
                case 10:
                    strMonthTH = "พฤศจิกายน";
                    break;
                case 11:
                    strMonthTH = "ธันวาคม";
                    break;
                default:
                    strMonthTH = "";
            }

            return date.getDate() + " " + strMonthTH + " " + sYear;
        }

        var numPageDisplay = 100;
        var myTable;
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
                            //"scrollX": true,
                            //"scrollY": "400px",
                            "bScrollCollapse": true,
                            "aaSorting": [],
                            "bFilter": false,
                            //"dom": '<"top"i>rt<"bottom"flp><"clear">',
                            "dom": '<"top"i>rt<"bottom"p>',
                            "bInfo": false,
                            "bProcessing": true,
                            //"bServerSide": true,
                            //"sAjaxSource": "http://127.0.0.1/table.php",
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
                
            })
        }

    </script>
</asp:Content>

