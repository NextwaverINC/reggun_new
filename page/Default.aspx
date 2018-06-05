<%@ Page Title="" Language="C#" MasterPageFile="~/master/main.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="master_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="mainApp">
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
                        <div class="widget-main">
                            <div class="row">
                                <div class="col-md-8 col-sm-12" style="padding-bottom: 10px">
                                    <div class="form-group">
                                        <div class="col-sm-4 col-xs-8" style="padding: 0px;">
                                            <p class="text-right"><strong>เลือกวันที่ต้องการค้นหา&nbsp;&nbsp;จากวันที่&nbsp;&nbsp;:&nbsp;&nbsp;</strong></p>
                                        </div>
                                        <div class="col-sm-3 col-xs-4" style="padding: 0px;">
                                          <%--  <input id="datestart" type="date" class="form-control" style="width: 100%" />--%>
                                                    <div class="input-group">
									  <input class="form-control date-picker" id="datestart"  placeholder="จากวันที่" type="text" data-date-format="dd/mm/yyyy" />
										 <span class="input-group-addon">
												 <i class="fa fa-calendar bigger-110"></i>
										 </span>
								 </div>
                                        </div>
                                        <div class="col-sm-2 col-xs-8" style="padding: 0px;">
                                            <p class="text-right"><strong>ถึงวันที่&nbsp;&nbsp;:&nbsp;&nbsp;</strong></p>
                                        </div>
                                        <div class="col-sm-3 col-xs-4" style="padding: 0px;">
                                   <%--         <input id="dateend" type="date" class="form-control" style="width: 100%" />--%>

                                            
                                                    <div class="input-group">
									  <input class="form-control date-picker" id="dateend"  placeholder="ถึงวันที่" type="text" data-date-format="dd/mm/yyyy" />
										 <span class="input-group-addon">
												 <i class="fa fa-calendar bigger-110"></i>
										 </span>
								 </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-12 col-xs-12" style="padding-bottom: 10px">
                                    <div class="col-md-7 col-sm-7 col-xs-12" style="padding: 0px;">
                                        <div class="form-group">
                                            <div class="col-sm-4 col-xs-8" style="padding: 0px;">
                                                <p class="text-right"><strong>Status&nbsp;&nbsp;:&nbsp;&nbsp;</strong></p>
                                            </div>
                                            <div class="col-sm-8 col-xs-4" style="padding: 0px;">
                                                <div class="multiselect">
                                                    <label>
                                                        <input type="checkbox" name="option[]" value="Create" />Create</label>
                                                    <label>
                                                        <input type="checkbox" name="option[]" value="Scan" />Scan</label>
                                                    <label>
                                                        <input type="checkbox" name="option[]" value="Save" />Save</label>
                                                    <label>
                                                        <input type="checkbox" name="option[]" value="Submit" />Submit</label>
                                                    <label>
                                                        <input type="checkbox" name="option[]" value="Approve" />Approve</label>
                                                </div>
                                                <%--<select id="ddlStatus" class="form-control" multiple>
                                                    <option value="Create">Create</option>
                                                    <option value="Scan">Scan</option>
                                                    <option value="Save">Save</option>
                                                    <option value="Submit">Submit</option>
                                                    <option value="Approve">Approve</option>
                                                </select>--%>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-5 col-sm-5 col-xs-12" style="padding: 0px;">
                                        <div class="col-lg-12" style="padding: 0px;">
                                            <button class="btn btn-app btn-success btn-sm" ng-click="fnSearchData()" style="padding: 5px; float: right;">
                                                ค้นหา
                                            </button>
                                        </div>
                                        <div class="col-lg-12" style="padding: 0px;">
                                            <button class="btn btn-app btn-success btn-sm" ng-click="ExportCsv()" style="padding: 5px; float: right;">
                                                ส่งออก
                                            </button>
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
                    <div>
                        <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr style="width: 100%">
                                    <th class="text-center">BookNo&nbsp;</th>
                                    <th class="text-center">PageNo&nbsp;</th>
                                    <th class="text-center">User&nbsp;</th>
                                    <th class="text-center">Status&nbsp;</th>
                                    <th class="text-center">Update&nbsp;</th>
                                    <th class="text-center">ชนิดอาวุธปืน&nbsp;</th>
                                    <th class="text-center">ยี่ห้อ&nbsp;</th>
                                    <th class="text-center">เจ้าของอาวุธปืน&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr ng-repeat="item in DATA" style="width: 100%">
                                    <td nowrap>{{item.BookNo}}</td>
                                    <td nowrap>{{item.PageNo}}</td>
                                    <td nowrap>{{item.UpdateBy}}</td>
                                    <td nowrap>{{item.PageStatus}}</td>
                                    <td nowrap>{{item.UpdateDate}}</td>
                                    <td nowrap>{{item.GunType}}</td>
                                    <td nowrap>{{item.GunBrand}}</td>
                                    <td nowrap>{{item.GunOwner}}</td>
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
            bootbox.confirm("<span class='bigger-125'>" + msg + "</span>", function (result) {
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

            $scope.fnSearchData = function () {
                $scope.DATA = [];
                var dateStart = document.getElementById('datestart').value;
                var dateEnd = document.getElementById('dateend').value;
                var pStatus = "";//document.getElementById('ddlStatus').value;

                var checkboxes = document.getElementsByName('option[]');
                var vals = "";
                for (var i = 0, n = checkboxes.length; i < n; i++) {
                    if (checkboxes[i].checked) {
                        vals += "," + checkboxes[i].value;
                    }
                }

                pStatus = vals.substring(1);

                if (dateStart == "")
                    alert("เลือกวันที่");
                else if (dateEnd == "")
                    alert("เลือกวันที่");
                else if (pStatus == "")
                    alert("เลือกสถานะ");
                else {
                    fnLoading();
                    var data = $.param({
                        Command: 'SearchDataGun',
                        datestart: dateStart,
                        dateend: dateEnd,
                        pstatus: pStatus
                    });

                    $http.post("../server/Server_Gunbook.aspx", data, config)
                        .success(function (data, status, headers, config) {
                            fnUnLoading();
                            window.location.href = "Default.aspx?SRD=" + data.SRD;
                        })
                        .error(function (data, status, header, config) { fnUnLoading(); });
                }
            }

            $scope.LoadData = function () {
                fnLoading();
                if (getParamValue("SRD") == null) {
                    window.setTimeout(initpage, 100);
                    fnUnLoading();
                }
                else {
                    fnUnLoading();
                    var data = $.param({
                        Command: 'LoadDataGun',
                        SRD: getParamValue("SRD")
                    });

                    $http.post("../server/Server_Gunbook.aspx", data, config)
                        .success(function (data, status, headers, config) {
                            $scope.DATA = data.records;

                            document.getElementById('datestart').value = data.sdate;
                            document.getElementById('dateend').value = data.edate;

                            var pstatus = data.pstatus.split(',');

                            var checkboxes = document.getElementsByName('option[]');
                            for (var i = 0, n = checkboxes.length; i < n; i++) {
                                if (pstatus.indexOf(checkboxes[i].value) > -1) {
                                    checkboxes[i].checked = true;
                                }
                            }

                            window.setTimeout(initpage, 100);
                        })
                        .error(function (data, status, header, config) { });
                }
            }

            $scope.ExportCsv = function () {

                if (!angular.isUndefined($scope.DATA)) {
                    if ($scope.DATA.length > 0) {
                        var csvContent = "data:text/csv,";

                        csvContent += "BookNo, PageNo, PageStatus, UpdateBy, UpdateDate, Month, Day, Hour, GunType, GunBrand, GunOwner" + "\n";

                        angular.forEach($scope.DATA, function (value, key) {
                            var datestr = value.UpdateDate.split(" ")[0];
                            var timestr = value.UpdateDate.split(" ")[1];

                            var daystr = datestr.split("/")[0];
                            var monthstr = datestr.split("/")[1];

                            var hourstr = timestr.split(":")[0];

                            csvContent += value.BookNo + ", " + value.PageNo + ", " + value.PageStatus + ", " + value.UpdateBy + ", " + value.UpdateDate + ", " + monthstr + ", " + daystr + ", " + hourstr + ", " + value.GunType + ", " + value.GunBrand + ", " + value.GunOwner + "\n";
                        });
                        //data.forEach(function ($scope.DATA, index) {

                        //    dataString = infoArray.join(",");
                        //    csvContent += index < data.length ? dataString + "\n" : dataString;

                        //}); 

                        var encodedUri = encodeURI(csvContent);
                        var link = document.createElement("a");
                        link.setAttribute("href", encodedUri);
                        link.setAttribute("download", "data.csv");
                        document.body.appendChild(link); // Required for FF

                        link.click();

                        //var data = '"Column One","Column Two","Column Three"';

                        //var aLink = document.createElement('a');
                        //var evt = document.createEvent("HTMLEvents");
                        //evt.initEvent("click");
                        //aLink.download = '2.csv';
                        //aLink.href = 'data:text/csv;charset=UTF-8,' + '\uFEFF' + encodeURIComponent(data);
                        //aLink.dispatchEvent(evt);

                    }
                    else {
                        alert("ไม่มีข้อมูล");
                    }
                }
                else {
                    alert("ไม่มีข้อมูล");
                }
            }

            $scope.LoadData();

            $scope.LoadPdf = function () {
                fnLoading();

                fnUnLoading();
                var data = $.param({
                    Command: 'LoadPdf'
                });

                $http.post("../server/Server_Gunbook.aspx", data, config)
                    .success(function (data, status, headers, config) {
                        
                        var sampleArr = base64ToArrayBuffer(data.strArr);
                        saveByteArray("Sample report", sampleArr);
                        
                    })
                    .error(function (data, status, header, config) { });

            }

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
                            "aaSorting": [],
                            "bFilter": false,
                            //"dom": '<"top"i>rt<"bottom"flp><"clear">',
                            "dom": '<"top"i>rt<"bottom"p>',
                            "bInfo": false,
                            "bProcessing": true,
                            //"bServerSide": true,
                            //"sAjaxSource": "http://127.0.0.1/table.php"	,

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

