<%@ Page Title="" Language="C#" MasterPageFile="~/master/main.master" AutoEventWireup="true" CodeFile="importDataMultiPages.aspx.cs" Inherits="page_Default2" %>

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
                       
                        <div class=" col-sm-12" style="margin-bottom: 5px;">
                                            <div class="form-group">
                                                <div class="col-sm-2 col-xs-12">
                                                    <p class="text-right"><strong>คำนำหน้า :</strong></p>
                                                </div>
                                                <div class="col-sm-7 col-xs-12">
                                                    <input type="text" class="form-control" ng-model="prefix_tmp" style="width: 100%" ng-keypress="checkIfEnterKeyWasPressed($event)" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-sm-12" style="margin-bottom: 5px;">
                                            <div class="form-group">
                                                <div class="col-sm-2 col-xs-12">
                                                    <p class="text-right"><strong>เลขทะเบียนอาวุธปืนเริ่มต้น :</strong></p>
                                                </div>
                                                <div class="col-sm-7 col-xs-12">
                                                    <input type="text" class="form-control" ng-model="startid" style="width: 100%" ng-keypress="checkIfEnterKeyWasPressed($event)" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" ng-show="boolmultirow">
                                        <div class=" col-sm-12" style="margin-bottom: 5px;">
                                            <div class="form-group">
                                                <div class="col-sm-2 col-xs-12">
                                                    <p class="text-right"><strong>ถึงเลขทะเบียนอาวุธปืนที่ :</strong></p>
                                                </div>
                                                <div class="col-sm-7 col-xs-12">
                                                    <input type="text" class="form-control" ng-model="endid" style="width: 100%" ng-keypress="checkIfEnterKeyWasPressed($event)" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-sm-12" style="margin-bottom: 5px;">
                                            <div class="form-group">
                                                <div class="col-sm-2 col-xs-12">
                                                    <p class="text-right"><strong>คำลงท้าย :</strong></p>
                                                </div>
                                                <div class="col-sm-7 col-xs-12">
                                                    <input type="text" class="form-control" ng-model="postfix_tmp" style="width: 100%" ng-keypress="checkIfEnterKeyWasPressed($event)" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" ng-hide="boolmultirow">
                                        <div class=" col-sm-12" style="margin-bottom: 5px;">
                                            <div class="form-group">
                                                <div class="col-sm-2 col-xs-12">
                                                    <p class="text-right"><strong>ทะเบียนอาวุธปืน :</strong></p>
                                                </div>
                                                <div class="col-sm-7 col-xs-12">
                                                    <input type="text" class="form-control" ng-model="RecordData.GunRegID" style="width: 100%" ng-keypress="checkIfEnterKeyWasPressed($event)" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-sm-12" style="margin-bottom: 5px;">
                                            <div class="form-group">
                                                <div class="col-sm-2 col-xs-12">
                                                    <p class="text-right"><strong>เลขหมายอาวุธปืน :</strong></p>
                                                </div>
                                                <div class="col-sm-7 col-xs-12">
                                                    <input type="text" class="form-control" ng-model="RecordData.GunNo" style="width: 100%" ng-keypress="checkIfEnterKeyWasPressed($event)" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                      
                                        <div class=" col-sm-12" style="margin-bottom: 5px;">
                                            <div class="form-group">
                                                <div class="col-sm-2 col-xs-12">
                                                    <p class="text-right"><strong>ชนิดอาวุธปืน :</strong></p>
                                                </div>
                                                <div class="col-sm-7 col-xs-12">
                                                    <div class="input-group">
                                                        <input class="form-control" type="text" ng-model="RecordData.GunType" list="dtlGunType" ng-keypress="checkIfEnterKeyWasPressed($event)" />
                                                        <datalist id="dtlGunType">
                                                            <option ng-repeat="item in datalistGunType" value="{{item}}" />
                                                        </datalist>
                                                        <a class="input-group-addon" ng-click="openDataStandard('GunType', RecordData.GunType)">
                                                            <i class="ace-icon fa fa-plus"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-sm-12" style="margin-bottom: 5px;">
                                            <div class="form-group">
                                                <div class="col-sm-2  col-xs-12">
                                                    <p class="text-right"><strong>ขนาด :</strong></p>
                                                </div>
                                                <div class="col-sm-7 col-xs-12">
                                                    <div class="input-group">
                                                        <input class="form-control" type="text" ng-model="RecordData.GunSize" list="dtlGunSize" ng-keypress="checkIfEnterKeyWasPressed($event)" />
                                                        <datalist id="dtlGunSize">
                                                            <option ng-repeat="item in datalistGunSize" value="{{item}}" />
                                                        </datalist>
                                                        <a class="input-group-addon" ng-click="openDataStandard('GunSize', RecordData.GunSize)">
                                                            <i class="ace-icon fa fa-plus"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-sm-12" style="margin-bottom: 5px;">
                                            <div class="form-group">
                                                <div class="col-sm-2 col-xs-12">
                                                    <p class="text-right"><strong>ยี่ห้อ :</strong></p>
                                                </div>
                                                <div class="col-sm-7 col-xs-12">
                                                    <div class="input-group">
                                                        <input class="form-control" type="text" ng-model="RecordData.GunBrand" list="dtlGunBrand" ng-keypress="checkIfEnterKeyWasPressed($event)" />
                                                        <datalist id="dtlGunBrand">
                                                            <option ng-repeat="item in datalistGunBrand" value="{{item}}" />
                                                        </datalist>
                                                        <a class="input-group-addon" ng-click="openDataStandard('GunBrand', RecordData.GunBrand)">
                                                            <i class="ace-icon fa fa-plus"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-sm-12" style="margin-bottom: 5px;">
                                            <div class="form-group">
                                                <div class="col-sm-2 col-xs-12">
                                                    <p class="text-right"><strong>บรรจุ(นัด) :</strong></p>
                                                </div>
                                                <div class="col-sm-7 col-xs-12">
                                                    <input type="number" class="form-control" ng-model="RecordData.GunMaxShot" style="width: 100%" ng-keypress="checkIfEnterKeyWasPressed($event)" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-sm-12" style="margin-bottom: 5px;">
                                            <div class="form-group">
                                                <div class="col-sm-2 col-xs-12">
                                                    <p class="text-right"><strong>ความยาวลำกล้อง :</strong></p>
                                                </div>
                                                <div class="col-sm-7 col-xs-12">
                                                    <div class="input-group">
                                                        <input class="form-control" type="text" ng-model="RecordData.GunBarrel" list="dtlGunBarrel" ng-keypress="checkIfEnterKeyWasPressed($event)" />
                                                        <datalist id="dtlGunBarrel">
                                                            <option ng-repeat="item in datalistGunBarrel" value="{{item}}" />
                                                        </datalist>
                                                        <a class="input-group-addon" ng-click="openDataStandard('GunBarrel', RecordData.GunBarrel)">
                                                            <i class="ace-icon fa fa-plus"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-sm-12" style="margin-bottom: 5px;">
                                            <div class="form-group">
                                                <div class="col-sm-2 col-xs-12">
                                                    <p class="text-right"><strong>สีอาวุธปืน :</strong></p>
                                                </div>
                                                <div class="col-sm-7 col-xs-12">
                                                    <div class="input-group">
                                                        <input class="form-control" type="text" ng-model="RecordData.GunColor" list="dtlGunColor" ng-keypress="checkIfEnterKeyWasPressed($event)" />
                                                        <datalist id="dtlGunColor">
                                                            <option ng-repeat="item in datalistGunColor" value="{{item}}" />
                                                        </datalist>
                                                        <a class="input-group-addon" ng-click="openDataStandard('GunColor', RecordData.GunColor)">
                                                            <i class="ace-icon fa fa-plus"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-sm-12" style="margin-bottom: 5px;">
                                            <div class="form-group">
                                                <div class="col-sm-2 col-xs-12">
                                                    <p class="text-right"><strong>เจ้าของอาวุธปืน :</strong></p>
                                                </div>
                                                <div class="col-sm-7 col-xs-12">
                                                    <div class="input-group">
                                                        <input class="form-control" type="text" ng-model="RecordData.GunOwner" list="dtlGunOwner" ng-keypress="checkIfEnterKeyWasPressed($event)" />
                                                        <datalist id="dtlGunOwner">
                                                            <option ng-repeat="item in datalistGunOwner" value="{{item}}" />
                                                        </datalist>
                                                        <a class="input-group-addon" ng-click="openDataStandard('GunOwner', RecordData.GunOwner)">
                                                            <i class="ace-icon fa fa-plus"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-sm-12" style="margin-bottom: 5px;">
                                            <div class="form-group">
                                                <div class="col-sm-2 col-xs-12">
                                                    <p class="text-right"><strong>จำนวน :</strong></p>
                                                </div>
                                                <div class="col-sm-7 col-xs-12">
                                                    <input type="number" class="form-control" ng-model="RecordData.GunLottotal" style="width: 100%" ng-keypress="checkIfEnterKeyWasPressed($event)" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-sm-12" style="margin-bottom: 5px;">
                                            <div class="form-group">
                                                <div class="col-sm-2 col-xs-12">
                                                    <p class="text-right"><strong>หมายเหตุ :</strong></p>
                                                </div>
                                                <div class="col-sm-7 col-xs-12">
                                                    <input type="text" class="form-control" ng-model="RecordData.GunRemark" style="width: 100%" ng-keypress="checkIfEnterKeyWasPressed($event)" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-sm-12" style="margin-bottom: 5px;">
                                            <div class="form-group">
                                                <div class="col-sm-2 col-xs-12">
                                                    <p class="text-right"><strong>วันที่ลงทะเบียน :</strong></p>
                                                </div>
                                                <div class="col-sm-7 col-xs-12">
                                                    <input id="GunRegDate" type="text" class="form-control input-mask-date" placeholder="dd/mm/yyyy" ng-keypress="checkIfEnterKeyWasPressed($event)" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-sm-12" style="margin-bottom: 5px;">
                                            <div class="form-group">
                                                <div class="col-sm-2 col-xs-12">
                                                    <p class="text-right"><strong>ประเทศนำเข้า :</strong></p>
                                                </div>
                                                <div class="col-sm-7 col-xs-12">
                                                    <div class="input-group">
                                                        <input class="form-control" type="text" ng-model="RecordData.GunCountry" list="dtlGunCountry" ng-keypress="checkIfEnterKeyWasPressed($event)" />
                                                        <datalist id="dtlGunCountry">
                                                            <option ng-repeat="item in datalistGunCountry" value="{{item}}" />
                                                        </datalist>
                                                        <a class="input-group-addon" ng-click="openDataStandard('GunCountry', RecordData.GunCountry)">
                                                            <i class="ace-icon fa fa-plus"></i>
                                                        </a>
                                                    </div>
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
        var tempConfig_imgPath;
        var tempConfig_pdfPath

        function StartPages($scope, $http) {

            $scope.fnLoadData = function () {

                fnLoading();
                var data = $.param({
                    Command: 'GetDataWebConfig'
                });

                $http.post("../server/Server_Gunbook.aspx", data, config)
                    .success(function (data, status, headers, config) {

                      

                        fnUnLoading();
                    })
                    .error(function (data, status, header, config) { fnUnLoading(); });
            }

            $scope.fnLoadData();

            
            $scope.fnSave = function ()  {

              

              
               var data = $.param({
                    Command: 'TEST',
                    pathimg: 'AA'
                });

                $http.post("../server/Server_Gunbook.aspx", data, config)
                    .success(function (data, status, headers, config) {


                        fnUnLoading();
                    })
                    .error(function (data, status, header, config) { fnUnLoading(); });

            }
        }
        
 
        

    </script>
</asp:Content>

