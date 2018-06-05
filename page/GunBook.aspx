<%@ Page Title="" Language="C#" MasterPageFile="~/master/main.master" AutoEventWireup="true" CodeFile="GunBook.aspx.cs" Inherits="master_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="mainApp">
        <div class="row">
            <div class="col-lg-12">
                <div class="widget-box widget-color-blue" id="widget-box-9">
                    <div class="widget-header">
                        <h5 class="widget-title">ค้นหาข้อมูล</h5>
                        <div class="widget-toolbar">
                            <a href="#" data-action="collapse">
                                <i class="1 ace-icon fa fa-chevron-up bigger-125"></i>
                            </a>
                        </div>
                    </div>
                    <div class="widget-body">
                        <div class="widget-main">
                            <div class="row">
                                <div class="col-md-2 col-sm-3 col-xs-6 align-right" style="padding-right: 0px;">
                                    <span class="text-right"><strong>ปีหนังสือ&nbsp;&nbsp;:</strong></span>
                                </div>
                                <div class="col-md-2 col-sm-3 col-xs-6">
                                    <input type="text" class="form-control" ng-model="dataCondition.GunYear" placeholder="ปี พ.ศ." style="width: 100%" maxlength="4" size="4"/>
                                </div>

                                <div class="col-md-2 col-sm-3 col-xs-6 align-right" style="padding-right: 0px;">
                                    <span class="text-right"><strong>เลขหนังสือ&nbsp;&nbsp;:</strong></span>
                                </div>
                                <div class="col-md-2 col-sm-3 col-xs-6">
                                    <input type="number" class="form-control" ng-model="dataCondition.GunBookNo" style="width: 100%" />
                                </div>

                                <div class="col-md-4 col-sm-12 col-xs-12 text-right" style="padding-bottom: 10px">
                                    <button type="button" ng-click="fnSearchData()" class="btn btn-default" style="float: right;">
                                        <span class="glyphicon glyphicon-search">&nbsp;ค้นหา</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-12">
                <div class="widget-box widget-color-blue">
                    <div style="margin-bottom: 3px; background-color: #428bca">
                        <button class="btn btn-primary" ng-click="fnChkGenPDF()" title="สร้าง/อัพเดท E-book หนังสือทะเบียนอาวุธปืน">
                            <i class="ace-icon fa fa-plus align-center bigger-125"></i>
                            สร้าง/อัพเดท E-book หนังสือทะเบียนอาวุธปืน
                        </button>
                        <button class="btn btn-primary" ng-click="fnOpenPdf()" title="สร้าง/อัพเดท E-book หนังสือทะเบียนอาวุธปืน">
                            <i class="ace-icon fa fa-eye align-center bigger-125"></i>
                            เปิด E-Book
                        </button>
                    </div>
                    <div>
                        <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr style="width: 100%">
                                    <th class="text-center">&nbsp;</th>
                                    <%--<th class="text-center">&nbsp;</th>--%>
                                    <th class="text-center">หนังสือเล่มที่&nbsp;</th>
                                    <th class="text-center">หนังสือปีที่&nbsp;</th>
                                    <th class="text-center">สถานะการสร้าง E-Book&nbsp;</th>
                                    <th class="text-center">ทะเบียนอาวุธปืนเริ่มต้น&nbsp;</th>
                                    <th class="text-center">ทะเบียนอาวุธปืนสิ้นสุด&nbsp;</th>
                                    <th class="text-center">จำนวนหน้า&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr ng-repeat="(key,item) in DATA" style="width: 100%">
                                    <td class="center">
                                        <label class="pos-rel">
                                            <input type="checkbox" name="selBook" class="ace" value="{{item.BookYear + ',' + item.BookNo + ',' + item.PageTotal}}" />
                                            <span class="lbl"></span>
                                        </label>
                                    </td>
                                    <%--<td class="text-center"><a ng-click="fnOpenPdf(item.BookYear, item.BookNo)" title="ดูเอกสาร" style="cursor: pointer">
                                        <span class="fa fa-eye fa-lg"></span></a></td>--%>
                                    <td nowrap>{{item.BookNo}}</td>
                                    <td nowrap>{{item.BookYear}}</td>                                    
                                    <td nowrap>{{item.GenEBook}}</td>
                                    <td nowrap>{{item.GunRegStart}}</td>
                                    <td nowrap>{{item.GunRegEnd}}</td>
                                    <td nowrap>{{item.PageTotal}}</td>
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

    <script>   
        function fnLoading() {
            document.getElementById("mainApp").style.display = "none";
            document.getElementById("loading").style.display = "";
        }
        function fnUnLoading() {
            document.getElementById("mainApp").style.display = "";
            document.getElementById("loading").style.display = "none";
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
            bootbox.confirm("<span class='bigger-125'>" + msg +"</span>", function (result) {
                if (result) {
                    fun(parameter);
                }
            });
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

            $scope.dataCondition = {
                GunYear: ""
                , GunBookNo: ""
            };

            $scope.fnSearchData = function () {

                fnLoading();
                $('#dynamic-table').DataTable().destroy();
                var data = $.param({
                    Command: 'LoadGunBook',
                    GunBookNo: $scope.dataCondition.GunBookNo,
                    GunYear: $scope.dataCondition.GunYear
                });

                $http.post("../server/Server_Gunbook.aspx", data, config)
                    .success(function (data, status, headers, config) {
                        $scope.DATA = data.records;
                        window.setTimeout(initpage, 100);
                        fnUnLoading();
                    })
                    .error(function (data, status, header, config) { fnUnLoading(); });
            }

            $scope.fnChkGenPDF = function () {
                var checkboxes = document.getElementsByName('selBook');
                var vals = "";
                for (var i = 0, n = checkboxes.length; i < n; i++) {
                    if (checkboxes[i].checked) {
                        vals = "" + checkboxes[i].value;
                    }
                }

                if (vals == "")
                    showmessage("โปรดเลือกรายการที่จะทำสร้างหรืออัพเดท E-Book");
                else {

                    $scope.vals = vals;
                    fnLoading();
                    var data = $.param({
                        Command: 'CheckGenEBook',
                        GunBookNo: vals
                    });

                    $http.post("../server/Server_Gunbook.aspx", data, config)
                        .success(function (data, status, headers, config) {
                            if (data.Result == "T") {
                                $scope.fnGenPDF();
                            }
                            else if (data.Result == "F") {
                                fnUnLoading();
                                showconfirm(data.Msg, $scope.fnGenPDF);

                            }
                            else if (data.Result == "N") {
                                showmessage(data.Msg);
                                fnUnLoading();
                            }
                            else {
                                fnUnLoading();
                            }
                        })
                        .error(function (data, status, header, config) { fnUnLoading(); });
                }

            }
            
            $scope.fnGenPDF = function () {
                //var checkboxes = document.getElementsByName('selBook');
                //var vals = "";
                //for (var i = 0, n = checkboxes.length; i < n; i++) {
                //    if (checkboxes[i].checked) {
                //        vals = "" + checkboxes[i].value;
                //    }
                //}

                //if (vals == "")
                //showmessage("โปรดเลือกรายการที่จะทำสร้างหรืออัพเดท E-Book");
                //else {
                fnLoading();
                var data = $.param({
                    Command: 'GenEBook',
                    GunBookNo: $scope.vals
                });

                $http.post("../server/Server_Gunbook.aspx", data, config)
                    .success(function (data, status, headers, config) {
                        if (data.Result == "T")
                            showmessage("สร้าง E-Book เรียบร้อย");
                        else
                            showmessage("ไม่สามารถ E-Book ได้ เนื่องจากยังไม่มีการแสกนข้อมูล");
                        fnUnLoading();
                    })
                    .error(function (data, status, header, config) { fnUnLoading(); });
                //}

            }

            $scope.fnOpenPdf = function () {

                var checkboxes = document.getElementsByName('selBook');
                var vals = "";
                for (var i = 0, n = checkboxes.length; i < n; i++) {
                    if (checkboxes[i].checked) {
                        vals = "" + checkboxes[i].value;
                    }
                }

                var BookNo = "";
                var BookYear = "";

                if (vals == "")
                    showmessage("โปรดเลือกรายการที่จะทำสร้างหรืออัพเดท E-Book");
                else {
                    BookNo = vals.split(",")[1];
                    BookYear = vals.split(",")[0];

                    fnLoading();
                    var data = $.param({
                        Command: 'CheckBook',
                        GunBookNo: BookNo,
                        GunBookYear: BookYear
                    });

                    $http.post("../server/Server_Gunbook.aspx", data, config)
                        .success(function (data, status, headers, config) {
                            if (data.Result == "T")
                                window.open('open_pdf.aspx?BookNo=' + BookNo + '&BookYear=' + BookYear, '_blank');
                            else
                                showmessage("ยังไม่มี E-Book หนังสือเลขที่ " + BookNo + " กรุณาเลือกสร้าง E-Book");
                            fnUnLoading();
                        })
                        .error(function (data, status, header, config) { fnUnLoading(); });
                }
            }
            $scope.fnSearchData();
        }

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

        var numPageDisplay = 20;
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
                            "aaSorting": [],
                            "bFilter": false,
                            //"dom": '<"top"i>rt<"bottom"flp><"clear">',
                            "dom": '<"top"i>rt<"bottom"p>',
                            "bInfo": false,
                            "bProcessing": true,
                            //"bServerSide": true,
                            //"sAjaxSource": "http://127.0.0.1/table.php",

                            //,
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

            })
        }
    </script>

</asp:Content>

