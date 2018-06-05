<%@ Page Title="" Language="C#" MasterPageFile="~/master/main.master" AutoEventWireup="true" CodeFile="GunRegistrationHide.aspx.cs" Inherits="master_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .form-control {
            height: 30px;
            margin-bottom: 5px;
        }
    </style>
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
                            <div class="form-group"></div>
                            <div class="row">

                                <div class="col-md-2 col-sm-3 col-xs-6 align-right" style="padding-right: 0px;">
                                    <span class="text-right"><strong>เครื่องหมายทะเบียนอาวุธปืน&nbsp;&nbsp;:</strong></span>
                                </div>
                                <div class="col-md-2 col-sm-3 col-xs-6">
                                    <input type="text" class="form-control" ng-model="dataCondition.GunRegID" style="width: 100%" />
                                </div>

                                <div class="col-md-2 col-sm-3 col-xs-6 align-right" style="padding-right: 0px;">
                                    <span class="text-right"><strong>หมายเลขประจำอาวุธปืน&nbsp;&nbsp;:</strong></span>
                                </div>
                                <div class="col-md-2 col-sm-3 col-xs-6">
                                    <input type="text" class="form-control" ng-model="dataCondition.GunNo" style="width: 100%" />
                                </div>

                                <div class="col-md-2 col-sm-3 col-xs-6 align-right" style="padding-right: 0px;">
                                    <span class="text-right"><strong>ประเภทอาวุธปืน&nbsp;&nbsp;:</strong></span>
                                </div>
                                <div class="col-md-2 col-sm-3 col-xs-6">
                                    <select id="ddlGroup" class="form-control" ng-model="dataCondition.GunGroup" style="width: 100%">
                                        <option value="">ไม่ระบุ</option>
                                        <option value="สั้น">สั้น</option>
                                        <option value="ยาว">ยาว</option>
                                    </select>
                                </div>

                                <div class="col-md-2 col-sm-3 col-xs-6 align-right" style="padding-right: 0px;">
                                    <span class="text-right"><strong>ชนิดอาวุธปืน&nbsp;&nbsp;:</strong></span>
                                </div>
                                <div class="col-md-2 col-sm-3 col-xs-6">
                                    <input type="text" class="form-control" ng-model="dataCondition.GunType" style="width: 100%" />
                                </div>

                                <div class="col-md-2 col-sm-3 col-xs-6 align-right" style="padding-right: 0px;">
                                    <span class="text-right"><strong>ยี่ห้ออาวุธปืน&nbsp;&nbsp;:</strong></span>
                                </div>
                                <div class="col-md-2 col-sm-3 col-xs-6">
                                    <input type="text" class="form-control" ng-model="dataCondition.GunBrand" style="width: 100%" />
                                </div>

                                <div class="col-md-2 col-sm-3 col-xs-6 align-right" style="padding-right: 0px;">
                                    <span class="text-right"><strong>ขนาดอาวุธปืน&nbsp;&nbsp;:</strong></span>
                                </div>
                                <div class="col-md-2 col-sm-3 col-xs-6">
                                    <input type="text" class="form-control" ng-model="dataCondition.GunSize" style="width: 100%" />
                                </div>

                                <div class="col-md-2 col-sm-3 col-xs-6 align-right" style="padding-right: 0px;">
                                    <span class="text-right"><strong>ประเทศนำเข้า&nbsp;&nbsp;:</strong></span>
                                </div>
                                <div class="col-md-2 col-sm-3 col-xs-6">
                                    <input type="text" class="form-control" ng-model="dataCondition.GunCountry" style="width: 100%" />
                                </div>
                                
                                <div class="col-md-2 col-sm-3 col-xs-6 align-right" style="padding: 0px;">
                                    <span class="text-right"><strong>ชื่อผู้นำอาวุธปืนมาทำเครื่องหมายทะเบียน&nbsp;&nbsp;:</strong></span>
                                </div>
                                <div class="col-md-2 col-sm-3 col-xs-6">
                                    <input type="text" class="form-control" ng-model="dataCondition.GunOwner" style="width: 100%" />
                                </div>

                                <div class="col-md-2 col-sm-3 col-xs-6 align-right" style="padding-right: 0px;">
                                    <span class="text-right"><strong>หมายเหตุ&nbsp;&nbsp;:</strong></span>
                                </div>
                                <div class="col-md-2 col-sm-3 col-xs-6">
                                    <input type="text" class="form-control" ng-model="dataCondition.GunRemark" style="width: 100%" />
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <button type="button" ng-click="fnSearchData()" class="btn btn-default" style="float: right;">
                                        <span class="glyphicon glyphicon-search">&nbsp;Search</span>
                                    </button>
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
                                    <th class="text-center">ดูเอกสาร&nbsp;</th>
                                    <th class="text-center">หนังสือเล่มที่&nbsp;</th>
                                    <th class="text-center">หน้าที่&nbsp;</th>
                                    <th class="text-center">เครื่องหมายทะเบียนอาวุธปืน&nbsp;</th>
                                    <th class="text-center">เลขหมายอาวุธปืน&nbsp;</th>
                                    <th class="text-center">ชนิดอาวุธปืน&nbsp;</th>
                                    <th class="text-center">ชื่ออาวุธปืน&nbsp;</th>
                                    <th class="text-center">ขนาดอาวุธปืน&nbsp;</th>
                                    <th class="text-center">ยี่ห้ออาวุธ&nbsp;</th>
                                    <th class="text-center">ขนาดบรรจุ&nbsp;</th>
                                    <th class="text-center">ความยาวลำกล้อง&nbsp;</th>
                                    <th class="text-center">สีอาวุธปืน&nbsp;</th>
                                    <th class="text-center">ชื่อผู้นำอาวุธปืนมาทำเครื่องหมายทะเบียน&nbsp;</th>
                                    <th class="text-center">วันที่ทำเครื่องหมายทะเบียน&nbsp;</th>
                                    <th class="text-center">ประเทศนำเข้า&nbsp;</th>
                                    <th class="text-center">หมายเหตุ&nbsp;</th>
                                    <th class="text-center">จำนวนที่นำมาจดทะเบียน&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr ng-repeat="item in DATA" style="width: 100%">
                                    <td nowrap><a ng-click="fnopenImage(item.BookNo, item.PageNo, item.PageVersion, item.GunRegID)" style="cursor: pointer">ดูเอกสาร</a></td>
                                    <td nowrap>{{item.BookNo}}</td>
                                    <td nowrap>{{item.PageNo}}</td>
                                    <td nowrap>{{item.GunRegID}}</td>
                                    <td nowrap>{{item.GunNo}}</td>
                                    <td nowrap>{{item.GunGroup}}</td>
                                    <td nowrap>{{item.GunType}}</td>
                                    <td nowrap>{{item.GunSize}}</td>
                                    <td nowrap>{{item.GunBrand}}</td>
                                    <td nowrap>{{item.GunMaxShot}}</td>
                                    <td nowrap>{{item.GunBarrel}}</td>
                                    <td nowrap>{{item.GunColor}}</td>
                                    <td nowrap>{{item.GunOwner}}</td>
                                    <td nowrap>{{item.GunRegDate}}</td>
                                    <td nowrap>{{item.GunCountry}}</td>
                                    <td nowrap>{{item.GunRemark}}</td>
                                    <td nowrap>{{item.GunLottotal}}</td>
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

            $scope.dataCondition = {
                GunRegID: ""
                , GunNo: ""
                , GunGroup: ""
                , GunType: ""
                , GunBrand: ""
                , GunSize: ""
                , GunCountry: ""
                , GunOwner: ""
                , GunRemark: ""
            };

            $scope.fnSearchData = function () {
                if ($scope.dataCondition.GunRegID == "" && $scope.dataCondition.GunNo == ""
                    && $scope.dataCondition.GunType == "" && $scope.dataCondition.GunBrand == "" && $scope.dataCondition.GunCountry == ""
                    && $scope.dataCondition.GunSize == "" && $scope.dataCondition.GunOwner == "" && $scope.dataCondition.GunRemark == "") {
                    alert("กรุณาระบุเงื่อนไข");
                } else if ($scope.dataCondition.GunRegID != "" && $scope.dataCondition.GunRegID.length < 4) {
                    alert("กรุณาเลขทะเบียนมากกว่า 3 ตัวอักษร");
                }
                else {
                    fnLoading();
                    $('#dynamic-table').DataTable().destroy();
                    var data = $.param({
                        Command: 'SearchGunReg',
                        GunRegID: $scope.dataCondition.GunRegID,
                        GunNo: $scope.dataCondition.GunNo,
                        GunGroup: $scope.dataCondition.GunGroup,
                        GunType: $scope.dataCondition.GunType,
                        GunBrand: $scope.dataCondition.GunBrand,
                        GunCountry: $scope.dataCondition.GunCountry,
                        GunSize: $scope.dataCondition.GunSize,
                        GunOwner: $scope.dataCondition.GunOwner,
                        GunRemark: $scope.dataCondition.GunRemark
                    });

                    $http.post("../server/Server_Gunbook.aspx", data, config)
                        .success(function (data, status, headers, config) {

                            $scope.DATA = data.records;
                            window.setTimeout(initpage, 100);
                            fnUnLoading();
                        })
                        .error(function (data, status, header, config) { fnUnLoading(); });
                }

            }
            //$scope.fnopenImage = function (BookNo, PageNo, VersionPage) {
            //    openImage(BookNo, PageNo, VersionPage);
            //}
            $scope.fnopenImage = function (BookNo, PageNo, VersionPage, GunRegID) {
                openImage(BookNo, PageNo, VersionPage, GunRegID);
            }
        }

        //function openImage(BookNo, PageNo, VersionPage) {
        //    window.open('../gunbook/showimage.aspx?Book=' + BookNo + '&Page=' + PageNo + '&Ver=' + VersionPage, '_blank');
        //}

        function openImage(BookNo, PageNo, VersionPage, GunRegID) {
            window.open('../gunbook/showimageHide.aspx?Book=' + BookNo + '&Page=' + PageNo + '&Ver=' + VersionPage + '&GunID=' + GunRegID, '_blank' );
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
                            "scrollX": true,
                            "scrollY": "400px",
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

