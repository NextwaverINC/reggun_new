<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImportDataMultiPages.aspx.cs" Inherits="gunbook_addPage" %>

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

                <script language="JavaScript">
                    document.onkeydown = chkEvent
                    function chkEvent(e) {
                        var keycode;
                        if (window.event) keycode = window.event.keyCode; //*** for IE ***//
                        else if (e) keycode = e.which; //*** for Firefox ***//
                        if (keycode == 13) {
                            return false;
                        }
                    }
</script>
                <div id="mainApp" ng-app="myApp" ng-controller="StartApp">
                    <div class="widget-box transparent" id="widget-box-2">
                        <div class="widget-header widget-header-small">
                            <h4 class="widget-title blue smaller">
                                <i class="ace-icon fa fa-edit blue"></i>
                                {{titleHead}} 
                            </h4>
           
                            <span style="color: black; font-size: small">&nbsp;&nbsp;&nbsp;&nbsp;
                              
                            </span>
                            <div class="widget-toolbar">
                                <a class="btn btn-info" onclick="fnSetValue()"  ng-click="fnSave('Save')" style="width: 100px;">
                                    <i class="ace-icon fa fa-floppy-o"></i>
                                    บันทึกหน้า
                                </a>
                              <a class="btn btn-success" onclick="fnSetValue()"  ng-click="fnSave('Success')" style="width: 100px;">
                                    <i class="ace-icon fa fa-check"></i>
                                    สำเร็จ
                                </a>
                                <a class="btn btn-danger" onclick="fnClose()" style="width: 100px;">
                                    <i class="ace-icon fa fa-remove"></i>
                                    ยกเลิก
                                </a>
                            </div>
                        </div>

                        <div class="widget-body">

                                  <div class="row">
            <div class="col-xs-12">
                    <div>
                      <div class="error-container">
                                    <div class="well">
                                        <h4 class="grey lighter smaller">
                                            <span class="blue">
                                                <i class="ace-icon fa fa-cogs"></i>
                                            </span>กำหนดรูปแบบเล่ม
                                        </h4>
                                        <hr />
                                        <div>
                                              <div class="row">
                        
                                                  <div class="col-sm-2">
                <label class="control-label no-padding-right text-right" >เล่มที่ : </label>
                                <input type="number" class="form-control" id="bookNo"  min="1" style="width: 100%; background-color: #f7f7f7;"/>
                                            </div>


                                                  <div class="col-sm-2">
                <label class="control-label no-padding-right text-right" >จำนวนรายการต่อหน้า : </label>
                                <input type="number" class="form-control" id="dataTotal"  min="1" style="width: 100%; background-color: #f7f7f7;" />
                                            </div>

                     <div class="col-sm-1">
                         <label class="control-label no-padding-right text-right" >ดูรูปภาพ : </label>
                                 <a class="btn btn-primary btn-success btn-sm" onclick="fnOpenImage();">
                                      <i class="ace-icon fa fa-picture-o bigger-110"></i> รูปภาพ
                                    </a>
                                            </div>

                                            </div>
                                        </div>

        
                                    </div>
                                </div>
                    </div>
            </div>
        </div>
                          
                            <div class="row" style="margin: 0px 15px 0px 15px;">
                                <div class="col-xs-12" style="overflow-x: scroll; padding-left: 0px; padding-right: 0px;">
                                    <table id="simple-table" class="table table-bordered table-hover">
                                        <thead>
                                            <tr style="background: #eeeeee;">
                                                <th class="text-center">&nbsp;</th>
                                                <th class="text-center">&nbsp;</th>
                                                <th class="text-center">ทบ.เริ่มต้น&nbsp;</th>
                                                <th class="text-center">ทบ.สิ้นสุด&nbsp;</th>
                                                <th class="text-center">ชนิดอาวุธปืน</th>
                                                <th class="text-center">ขนาด&nbsp;</th>
                                                <th class="text-center">ยี่ห้อ&nbsp;</th>
                                                <th class="text-center">บรรจุ(นัด)&nbsp;</th>
                                                <th class="text-center">ความยาวลำกล้อง&nbsp;</th>
                                                <th class="text-center">สีอาวุธปืน&nbsp;</th>
                                                <th class="text-center">เจ้าของอาวุธปืน&nbsp;</th>
                                                <th class="text-center">จำนวน&nbsp;</th>
                                                <th class="text-center">หมายเหตุ&nbsp;</th>
                                                <th class="text-center">วันที่ลงทะเบียน&nbsp;</th>
                                                <th class="text-center">ประเทศนำเข้า&nbsp;</th>
                                                <th class="text-center">&nbsp;</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr ng-repeat="item in DataRecords">
                                                <td>
                                                    <input type="checkbox" class="radio" name="datagun" onclick="checkboxClick(this)" ng-click="checkboxValue(item)" /></td>
                                                <td class="text-center" nowrap>
                                                    <span class="glyphicon glyphicon-edit" data-toggle="modal" data-target="#myModal" ng-click="editdata(item, $index)" style="color: #265691; font-size: 20px;"></span>
                                                </td>
                                                <td nowrap>{{item.GunIDstart}}</td>
                                                <td nowrap>{{item.GunIDend}}</td>
                                                <%--<td nowrap>{{item.GunGroup}}</td>--%>
                                                <td nowrap>{{item.GunType}}</td>
                                                <td nowrap>{{item.GunSize}}</td>
                                                <td nowrap>{{item.GunBrand}}</td>
                                                <td nowrap>{{item.GunMaxShot}}</td>
                                                <td nowrap>{{item.GunBarrel}}</td>
                                                <td nowrap>{{item.GunColor}}</td>
                                                <td nowrap>{{item.GunOwner}}</td>
                                                <td nowrap>{{item.GunLottotal}}</td>
                                                <td nowrap>{{item.GunRemark}}</td>
                                                <td nowrap>{{item.GunRegDate}}</td>
                                                <td nowrap>{{item.GunCountry}}</td>
                                                <td class="text-center" nowrap>
                                                    <span class="glyphicon glyphicon-trash" ng-click="addDelRow($index)" style="color: #a95553; font-size: 16px;"></span>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.span -->
                            </div>
                              <hr />
                       
                                                                       <div class="row" style="margin: 5px 15px 0px 0px">


                                      <div class="col-sm-9 text" style="padding: 2px;">
                                          <label id="MSG_RECORD" style="color: black"></label>
                                       </div>
                                       <div class="col-sm-2 text-right" style="padding: 2px;">
                                    <a class="btn btn-yellow"  ng-click="dupRow()">
                                        <i class="ace-icon fa fa-clone  "></i>ใช้ข้อมูลก่อนหน้า
                                    </a>
 
                                   </div>


                                <div class="col-sm-1 text-right" style="padding: 2px;">
                                    <a class="btn btn-success" data-toggle="modal" data-target="#myModalAddRecord" ng-click="clearId()">
                                        <i class="ace-icon fa fa-plus  "></i>สร้างชุดข้อมูล
                                    </a>
 
                                </div>
                            </div>
                          
                            <div class="row">
                                <center>
                                <label id="ERROR" style="color: red"></label>
                                    </center>
                            </div>
                        </div>
                    </div>

                    <div class="modal  bootstrap-dialog " id="myModal" role="dialog" data-backdrop="static" data-keyboard="false">
                        <div class="modal-dialog modal-dialog">
                            <div class="modal-content modal-content-fullscreen" style="background-color: #eff3f8;">
                                <!-- Modal Header -->
                                <div class="modal-header" style="padding: 5px; border: 0px;">
                               <%--     <button type="button" class="close"
                                        data-dismiss="modal">
                                        <span aria-hidden="true">&times;</span>
                                        <span class="sr-only">ปิด</span>
                                    </button>--%>
                                    <h4 class="modal-title">{{titleModal}}
                                    </h4>
                                </div>
                                <div class="modal-body" style="background-color: white;">
                           
                                    <div class="row" ng-hide="boolmultirow">
                                        <div class=" col-sm-12" style="margin-bottom: 5px;">
                                            <div class="form-group">
                                                <div class="col-sm-5 col-xs-12">
                                                    <p class="text-right"><strong>เลขทะเบียนอาวุธปืนเริ่มต้น :</strong></p>
                                                </div>
                                                <div class="col-sm-7 col-xs-12">
                                                    <input type="text" id="_idStrat" class="form-control" ng-model="RecordData.GunIDstart" style="width: 100%" ng-keypress="checkIfEnterKeyWasPressed($event)" ng-keydown="idStart($event)"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-sm-12" style="margin-bottom: 5px;">
                                            <div class="form-group">
                                                <div class="col-sm-5 col-xs-12">
                                                    <p class="text-right"><strong>ถึงเลขทะเบียนอาวุธปืนที่ :</strong></p>
                                                </div>
                                                <div class="col-sm-7 col-xs-12">
                                                    <input type="text"  id="_idEnd"  class="form-control" ng-model="RecordData.GunIDend" style="width: 100%" ng-keypress="checkIfEnterKeyWasPressed($event)" ng-keydown="idEnd($event)"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                     
                                        <div class=" col-sm-12" style="margin-bottom: 5px;">
                                            <div class="form-group">
                                                <div class="col-sm-5 col-xs-12">
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
                                                <div class="col-sm-5 col-xs-12">
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
                                                <div class="col-sm-5 col-xs-12">
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
                                                <div class="col-sm-5 col-xs-12">
                                                    <p class="text-right"><strong>บรรจุ(นัด) :</strong></p>
                                                </div>
                                                <div class="col-sm-7 col-xs-12">
                                                    <input type="number" class="form-control" ng-model="RecordData.GunMaxShot" style="width: 100%" ng-keypress="checkIfEnterKeyWasPressed($event)" min="0"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-sm-12" style="margin-bottom: 5px;">
                                            <div class="form-group">
                                                <div class="col-sm-5 col-xs-12">
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
                                                <div class="col-sm-5 col-xs-12">
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
                                                <div class="col-sm-5 col-xs-12">
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
                                                <div class="col-sm-5 col-xs-12">
                                                    <p class="text-right"><strong>วันที่ลงทะเบียน :</strong></p>
                                                </div>
                                                <div class="col-sm-7 col-xs-12">
                                                    <input id="GunRegDate" type="text" class="form-control input-mask-date" placeholder="dd/mm/yyyy" ng-keypress="checkIfEnterKeyWasPressed($event)" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-sm-12" style="margin-bottom: 5px;">
                                            <div class="form-group">
                                                <div class="col-sm-5 col-xs-12">
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

                                        <div class=" col-sm-12" style="margin-bottom: 5px;">
                                            <div class="form-group">
                                                <div class="col-sm-5 col-xs-12">
                                                    <p class="text-right"><strong>จำนวน :</strong></p>
                                                </div>
                                                <div class="col-sm-7 col-xs-12">
                                                    <input type="number" id="_gunLot" class="form-control" ng-model="RecordData.GunLottotal" style="width: 100%" ng-keypress="checkIfEnterKeyWasPressed($event)" ng-keydown="gunLott($event)"  min="0"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" col-sm-12" style="margin-bottom: 5px;">
                                            <div class="form-group">
                                                <div class="col-sm-5 col-xs-12">
                                                    <p class="text-right"><strong>หมายเหตุ :</strong></p>
                                                </div>
                                                <div class="col-sm-7 col-xs-12">
                                                    <input type="text" class="form-control" ng-model="RecordData.GunRemark" style="width: 100%" ng-keypress="checkIfEnterKeyWasPressed($event)" />
                                                </div>
                                            </div>
                                        </div>


                                          <center>
                                <label id="ERROR_DATA" style="color: red"></label>
                                    </center>
                                    </div>
                                </div>
                                <div class="modal-footer" style="border: 0px;">
                                    <div class="row">
                                          <div class="col-sm-10 text-right">
                                            <%--  <div class="text-right" id="addDelRowLast"></div>--%>
                                            <%--<a class="btn btn-success btn-xs" ng-click="addDelRowLast()">
                                                <i class="ace-icon fa fa-save bigger-110"></i>ยกเลิก
                                            </a>--%>
     
                                        </div>
                                        <div class="col-sm-2 text-right">
                                            <a class="btn btn-success btn-xs" onclick="fnSetValue()" ng-click="adddata()">
                                                <i class="ace-icon fa fa-save bigger-110"></i>บันทึก
                                            </a>
     
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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
                                        <h4 class="modal-title">สร้างช่วงของข้อมูล
                                        </h4>
                                    </div>
                                    <div class="modal-body">
                     
                                        <div style="width:100%;height:10px"></div>
                                        <div class="row">
                                            <div class=" col-sm-6">
                                                <div class="form-group">
                                                    <div class="col-sm-6 col-xs-12">
                                                        <p class="text-right"><strong>เลขทะเบียนอาวุธปืนเริ่มต้น :</strong></p>
                                                    </div>
                                                    <div class="col-sm-6 col-xs-12">
                                                        <input type="number" class="form-control" ng-model="startid" style="width: 100%" min="1" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class=" col-sm-6">
                                                <div class="form-group">
                                                    <div class="col-sm-6 col-xs-12">
                                                        <p class="text-right"><strong>ถึงเลขทะเบียนอาวุธปืนที่ :</strong></p>
                                                    </div>
                                                    <div class="col-sm-6 col-xs-12">
                                                        <input type="number" class="form-control" ng-model="endid" style="width: 100%" min="1"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                         
                                        <div class="row" style="margin: 15px 0px 0px 0px">
                                            <div class="col-sm-12 text-right">
                                                <a class="btn btn-success btn-xs"  ng-click="addRow()" data-dismiss="modal">
                                                    <i class="ace-icon fa fa-plus bigger-110"></i>สร้าง
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
            <form id="TheForm" method="post" action="showimage.aspx" target="TheWindow">
                <input type="hidden" name="pathimg" value="pathimg" />
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
    <script src="../assets/js/jquery.nestable.js"></script>
    <script src="../assets/js/jquery.maskedinput.js"></script>
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

    <%--<link href="../assets/js/date-time/bootstrap-datepicker.css" rel="stylesheet" />--%>
    <%--<script src="../assets/js/date-time/bootstrap-datepicker-custom.js"></script>--%>
    <%--<script src="../assets/js/date-time/locales/bootstrap-datepicker.th.min.js" charset="UTF-8"></script>--%>

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
            window.parent.closepopupfull();
        }
        //======================================================
        var app = angular.module('myApp', []);
        var config = { headers: { 'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;' } }
        app.controller('StartApp', StartApp);
        var $tmp_scope;
        var $tmp_http;
        var $tmpIdx;
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
            loadData($scope, $http, ID);

            $tmp_scope = $scope;
            $tmp_http = $http;

            $scope.titleHead = "ระบบจัดการชุดข้อมูลนำเข้า";

            $scope.titleModal = '';
            $scope.booledit = false;
            $scope.boolmultirow = false;
            $scope.idx = '';
            $scope.DataRecordsStandard = [];

            $scope.datalistGunType = ["GunType"];
            $scope.datalistGunSize = ["GunSize"];
            $scope.datalistGunBrand = ["GunBrand"];
            $scope.datalistGunBarrel = ["GunBarrel"];
            $scope.datalistGunColor = ["GunColor"];
            $scope.datalistGunOwner = ["GunOwner"];
            $scope.datalistGunCountry = ["GunCountry"];

            $tmp_idStart = '';
            $tmp_idEnd = '';

            $scope.RecordData = {
                //    GunRegID: '',
                //   GunNo: '',
                GunIDstart: '',
                GunIDend: '',
                GunGroup: '',
                GunType: '',
                GunSize: '',
                GunBrand: '',
                GunMaxShot: '',
                GunBarrel: '',
                GunColor: '',
                GunOwner: '',
                GunLottotal: '',
                GunRemark: '',
                GunRegDate: '',
                GunCountry: '',
                CreateDate: '',
                CreateBy: '',
                UpdateDate: '',
                UpdateBy: ''
            };

            $scope.clearRow = function () {
                document.getElementById('GunRegDate').value = "";
                $scope.RecordData = {
                    GunIDstart: '',
                    GunIDend: '',
                    //    GunNo: '',
                    GunGroup: '',
                    GunType: '',
                    GunSize: '',
                    GunBrand: '',
                    GunMaxShot: '',
                    GunBarrel: '',
                    GunColor: '',
                    GunOwner: '',
                    GunLottotal: '',
                    GunRemark: '',
                    GunRegDate: '',
                    GunCountry: '',
                    CreateDate: '',
                    CreateBy: '',
                    UpdateDate: '',
                    UpdateBy: ''
                };
            }
            $scope.startid = "";
            $scope.endid = "";

            $scope.clearId = function () {
                $scope.startid = "";
                $scope.endid = "";
                $scope.prefix_tmp = "";
                $scope.postfix_tmp = "";
            };

            $scope.addnew = function (multirow) {
                $scope.boolmultirow = false;
                $scope.titleModal = 'เพิ่มข้อมูล'
                $scope.booledit = false;

                var numberOfChecked = $('input:checkbox:checked').length;
                if (numberOfChecked == 0)
                    $scope.clearRow();
                document.getElementById('GunRegDate').value = $scope.RecordData.GunRegDate;
                if (multirow == "T") {
                    $scope.clearId();
                    $scope.boolmultirow = true;
                    $scope.titleModal = 'เพิ่มข้อมูลแบบกลุ่ม'
                }
            };
            $scope.addRow = function () {
                var idstart = $scope.startid;
                var idend = $scope.endid;
                var prefixid = "" + $scope.prefixid;
                var lastid = "" + $scope.lastid;


                var numLenght = $scope.startid.length;

                //  for (var i = numLenght; i <= numLenght; i++) {
                $scope.clearRow();

                $scope.RecordData.GunIDstart = idstart;
                $scope.RecordData.GunIDend = idend;
                $scope.DataRecords.push($scope.RecordData);
                //  }
            };
          
            $scope.dupRow = function () {

                var nRow = document.getElementById("simple-table").rows.length;
                var lRow = parseInt(nRow) - 1;
                var result = "";
                var oTable = document.getElementById('simple-table');

                var sID = "", lID = "", GunType = "", GunSize = "", GunSize = "", GunBrand = "", GunMaxShot = "", GunBarrel = "", GunColor = "", GunOwner = "", GunLottotal = "", GunRemark = "", GunCountry = "";;

                var oCells = oTable.rows.item(nRow - 1).cells;
                var cellLength = oCells.length;

                $scope.clearRow();

                var idstart = parseInt(oCells.item(3).innerHTML);
                var idLength = (oCells.item(3).innerHTML).length;
 
                var lnIdstart = (idstart+1).toString().length;

                var idNext;
                if (idLength > lnIdstart) {
                    var n = parseInt(idLength) - parseInt(lnIdstart);
                    var zeroPx;
                    for (var i = 0; i < n; i++) zeroPx += "0";

                    idNext = zeroPx.replace("undefined", "") + (idstart + 1).toString();

                }else {
                    idNext = idstart + 1;
                } 


                $scope.RecordData.GunIDstart = idNext ;
                $scope.RecordData.GunIDend = idNext ;
                //   $scope.RecordData.GunIDend = oCells.item(3).innerHTML.replace("&nbsp;", "");
                $scope.RecordData.GunType = oCells.item(4).innerHTML.replace("&nbsp;", "");
                $scope.RecordData.GunSize = oCells.item(5).innerHTML.replace("&nbsp;", "");
                $scope.RecordData.GunBrand = oCells.item(6).innerHTML.replace("&nbsp;", "");
                $scope.RecordData.GunMaxShot = oCells.item(7).innerHTML.replace("&nbsp;", "");
                $scope.RecordData.GunBarrel = oCells.item(8).innerHTML.replace("&nbsp;", "");
                $scope.RecordData.GunColor = oCells.item(9).innerHTML.replace("&nbsp;", "");
                $scope.RecordData.GunOwner = oCells.item(10).innerHTML.replace("&nbsp;", "");

                $scope.RecordData.GunRemark = oCells.item(12).innerHTML.replace("&nbsp;", "");
                $scope.RecordData.GunRegDate = oCells.item(13).innerHTML.replace("&nbsp;", "");
                $scope.RecordData.GunCountry = oCells.item(14).innerHTML.replace("&nbsp;", "");

                $scope.RecordData.GunLottotal = 1;

                $scope.DataRecords.push($scope.RecordData);

             //   $('#myModal').modal('show');

            };
            $scope.editRowDt = function () {
                $('#myModal').modal('show');
            };



            $scope.addDelRow = function (index) {
                $scope.DataRecords.splice(index, 1);
            };

            $scope.editdata = function (item, idx) {

                $tmpIdx = idx;

                $scope.titleModal = 'เพิ่มชุดข้อมูล'
                $scope.booledit = true;
                $scope.boolmultirow = false;
                $scope.RecordData = item;
                $scope.RecordData.GunIDstart = item.GunIDstart;
                $scope.RecordData.GunIDend = item.GunIDend;
                //     GunIDstart: '',  GunIDend: '',


                if (item.GunMaxShot != "")
                    $scope.RecordData.GunMaxShot = parseInt(item.GunMaxShot);

                if (item.GunLottotal != "")
                    $scope.RecordData.GunLottotal = parseInt(item.GunLottotal);


                document.getElementById('GunRegDate').value = $scope.RecordData.GunRegDate;

                $("input[type='checkbox']:checked").prop('checked', false);
                //var GunRegDate = $scope.RecordData.GunRegDate.split("/");

                //$scope.GunRegDate.day = parseInt(GunRegDate[0]);
                //$scope.GunRegDate.month = parseInt(GunRegDate[1]);
                //$scope.GunRegDate.year = parseInt(GunRegDate[2]);
                $scope.idx = idx;
            };

            $scope.editmultirow = function () {
                $scope.GunRegIDarray = [];

                try {

                    var idstart = parseInt($scope.startid);
                    var idend = parseInt($scope.endid);
                    var prefix = $scope.prefix_tmp;
                    var postfix = $scope.postfix_tmp;

                    var numLenght = $scope.startid.length;
                    var zeros = "0".repeat(numLenght);
                    for (var i = idstart; i <= idend; i++) {
                        var GunRegID = (zeros + i.toString()).slice(-1 * numLenght)
                        $scope.GunRegIDarray.push(prefix + GunRegID + postfix);
                    }
                    var d = new Date();
                    var strDate = formatDate(d);

                    angular.forEach($scope.DataRecords, function (value, key) {


                        if ($scope.GunRegIDarray.indexOf(value.GunRegID.toString()) > -1) {
                            value.GunGroup = $scope.RecordData.GunGroup;
                            value.GunType = $scope.RecordData.GunType;
                            value.GunSize = $scope.RecordData.GunSize;;
                            value.GunBrand = $scope.RecordData.GunBrand;
                            value.GunMaxShot = $scope.RecordData.GunMaxShot;
                            value.GunBarrel = $scope.RecordData.GunBarrel;
                            value.GunColor = $scope.RecordData.GunColor;
                            value.GunOwner = $scope.RecordData.GunOwner;
                            value.GunLottotal = $scope.RecordData.GunLottotal;
                            value.GunRemark = $scope.RecordData.GunRemark;
                            value.GunRegDate = $scope.RecordData.GunRegDate;
                            value.GunCountry = $scope.RecordData.GunCountry;
                            value.UpdateDate = strDate;
                            value.UpdateBy = $scope.UserAuth;
                        }

                    });
                }
                catch (err) {
                    alert(err.message);
                }

            };

            $scope.adddata = function () {

                if ($scope.RecordData.GunIDstart == null || $scope.RecordData.GunIDend == null) {
                    return;
                }

                try {
                    if ($scope.RecordData.GunIDstart == "" || $scope.RecordData.GunIDend == "") {

                        if ($scope.RecordData.GunIDstart == "")
                            document.getElementById("_idStrat").focus();
                        else
                            document.getElementById("_idEnd").focus();

                        ERROR_DATA.innerHTML = "กรุณากรอกเลขทะเบียนเริ่มต้น และเลขทะเบียนสิ้นให้ครบถ้วน";
                        alert("กรุณากรอกเลขทะเบียนเริ่มต้น และเลขทะเบียนสิ้นสุดให้ครบถ้วน");
                        return;
                    }

                    if (parseInt($scope.RecordData.GunIDend) < parseInt($scope.RecordData.GunIDstart)) {

                        ERROR_DATA.innerHTML = "เลขทะเบียนเริ่มต้น มากกว่าเลขทะเบียนสิ้นสุด กรุณากรอกใหม่";
                        alert("เลขทะเบียนเริ่มต้น มากกว่าเลขทะเบียนสิ้นสุด กรุณากรอกใหม่");
                        return;
                    }
                    ERROR_DATA.innerHTML = "";
                    $('#myModal').modal('hide');

                    var d = new Date();
                    var strDate = formatDate(d)

                    if ($scope.booledit == true) {
                        $scope.RecordData.UpdateDate = strDate;
                        $scope.RecordData.UpdateBy = $scope.UserAuth;
                        $scope.RecordData.GunRegDate = document.getElementById('GunRegDate').value;
                        //$scope.DataRecords.contacts[$scope.idx] = $scope.RecordData;
                    }
                    else if ($scope.boolmultirow == true) {
                        $scope.RecordData.GunRegDate = document.getElementById('GunRegDate').value;
                        $scope.editmultirow();
                    }
                    else {
                        $scope.RecordData.CreateDate = strDate;
                        $scope.RecordData.CreateBy = $scope.UserAuth;
                        $scope.RecordData.UpdateDate = strDate;
                        $scope.RecordData.UpdateBy = $scope.UserAuth;
                        $scope.RecordData.GunRegDate = document.getElementById('GunRegDate').value;
                        $scope.DataRecords.push($scope.RecordData);
                    }
                    $tmp_idStart = $scope.RecordData.GunIDstart;
                    $tmp_idEnd = $scope.RecordData.GunIDend;

                    $scope.fnSaveNew();

                }
                catch (err) {
                    alert(err.message);
                }
            };

            $scope.fnSave = function (type) {



                if (tempBOOKNO == "") {

                    alert('กรุณากรอกหมายเลขเล่ม');
                    document.getElementById("bookNo").focus();
                    return;
                }
                if (tempDataTotal == "") {
                    alert('กรุณากรอกจำนวนรายการต่อหน้า');
                    document.getElementById("dataTotal").focus();
                    return;
                }

                fnLoading();
                var data = $.param({
                    Command: 'fnSaveDataImport',
                    ID: getParamValue("ID"),
                    bookno: tempBOOKNO,
                    savetype: type,
                    datapagetolal: tempDataTotal,
                    record: JSON.stringify($scope.DataRecords)
                });

                $http.post("../server/Server_Gunbook.aspx", data, config)
                    .success(function (data, status, headers, config) {
                        if (data.output == 'OK') {
                            alert("บันทึกข้อมูลสำเร็จ");
                            fnUnLoading();
                            window.parent.refreshAllData();
                            return;
                        } else {
                            ERROR.innerHTML = data.MSG;
                            alert(data.MSG);
                            fnUnLoading();
                            setTimeout(function () {
                                ERROR.innerHTML = "";
                            }, 6000);
                        }
                    })
                    .error(function (data, status, header, config) { });
            }

            $scope.fnSaveNew = function () {

                if (tempBOOKNO == "") {

                    alert('กรุณากรอกหมายเลขเล่ม');
                    document.getElementById("bookNo").focus();
                    return;
                }
                if (tempDataTotal == "") {
                    alert('กรุณากรอกจำนวนรายการต่อหน้า');
                    document.getElementById("dataTotal").focus();
                    return;
                }
                var ID = getParamValue("ID");

                if (ID == "" || ID == null) {

                    return;
                }
                else {
                    var data = $.param({
                        Command: 'fnSaveDataImport',
                        ID: getParamValue("ID"),
                        bookno: tempBOOKNO,
                        savetype: 'Save',
                        datapagetolal: tempDataTotal,
                        record: JSON.stringify($scope.DataRecords)
                    });

                    $http.post("../server/Server_Gunbook.aspx", data, config)
                        .success(function (data, status, headers, config) {
                            if (data.output == 'OK') {

                                var nRow = document.getElementById("simple-table").rows.length;
                                var lRow = nRow;

                                var oTable = document.getElementById('simple-table');


                                var oCells = oTable.rows.item(nRow - 1).cells;

                                //---------------Page Count-------------------
                                var pageCurrent =0;
                                  var pageCount =0;
                                  for (var i = 1; i < lRow; i++) {
                                      var oCellsFd = oTable.rows.item(i).cells;
                                      var idStr = oCellsFd.item(2).innerHTML;
                                      var idEnd = oCellsFd.item(3).innerHTML;

                                      pageCount = pageCount + ((parseInt(idEnd) - parseInt(idStr)) + 1);

                                  }
 
                                  var listPage = 0; 
                                  var idWait = "";
                                  var round=0;
                              //    alert(pageCount);
                                  for (var i = 1; i <= pageCount; i++) {
                                      listPage++;

                                      if (listPage <20) {
                                          idWait = "true";
                                      }

                                      if (listPage == 20) {
                                          round++;
                                          listPage = 0;
                                          idWait = "false";
                                          pageCurrent++;
                                      }
                                  }
                                  if (idWait=="true") {
                                      pageCurrent = parseInt(pageCurrent) + 1;
                                  }
                             //     alert("Round : "+round);

                                //---------------------------------------

                                  MSG_RECORD.innerHTML = "บันทึกข้อมูลล่าสุด ชุดข้อมูลที่ " + oCells.item(2).innerHTML + " - " + oCells.item(3).innerHTML + " | หน้าปัจจุบัน หน้าที่ " + pageCurrent;


                                return;
                            } else {
                                alert(data.MSG);
                                ERROR.innerHTML = data.MSG;
                                setTimeout(function () {
                                    ERROR.innerHTML = "";
                                }, 6000);
                            }
                        })
                        .error(function (data, status, header, config) { });
                }


            }


            $scope.dataStandard = {
                datatype: "",
                dataname: "",
                datadesc: ""
            };

            $scope.fnSaveStandard = function () {
                if ($scope.dataStandard.dataname.trim() !== "") {
                    fnLoading();
                    var data = $.param({
                        Command: 'SaveStandardP',
                        ID: "",
                        datatype: $scope.dataStandard.datatype,
                        name: $scope.dataStandard.dataname,
                        desc: $scope.dataStandard.datadesc
                    });

                    $tmp_http.post("../server/Server_Gunbook.aspx", data, config)
                        .success(function (data, status, headers, config) {
                            if (data.output == 'OK') {
                                $scope.fnSelectStandard($scope.dataStandard.dataname);
                                switch ($scope.dataStandard.datatype) {
                                    case 'GunType':
                                        $scope.datalistGunType = data.DATARECORDS;
                                        break;
                                    case 'GunSize':
                                        $scope.datalistGunSize = data.DATARECORDS;
                                        break;
                                    case 'GunBrand':
                                        $scope.datalistGunBrand = data.DATARECORDS;
                                        break;
                                    case 'GunBarrel':
                                        $scope.datalistGunBarrel = data.DATARECORDS;
                                        break;
                                    case 'GunColor':
                                        $scope.datalistGunColor = data.DATARECORDS;
                                        break;
                                    case 'GunOwner':
                                        $scope.datalistGunOwner = data.DATARECORDS;
                                        break;
                                    case 'GunCountry':
                                        $scope.datalistGunCountry = data.DATARECORDS;
                                        break;
                                    default:
                                }
                                //$('#myModalAddStandard').modal('hide');
                                //$scope.openDataStandard($scope.dataStandard.datatype);
                                fnUnLoading();
                            } else {
                                fnUnLoading();
                                alert(data.MSG);

                            }
                        })
                        .error(function (data, status, header, config) { });
                }
                else {
                    alert("ระบุข้อมูล");
                }

            }

            $scope.openDataStandard = function (Datatype, Dataname) {

                $('#example').DataTable().destroy();

                fnLoading();

                $scope.dataStandard = {
                    datatype: "",
                    dataname: "",
                    datadesc: ""
                };

                var data = $.param({
                    Command: 'LoadStandardCode',
                    datatype: Datatype
                });
                ERRORStandard.innerHTML = "";
                divStandard.style.display = "";
                $scope.dataStandard.datatype = Datatype;
                $scope.dataStandard.dataname = Dataname;
                $scope.DataRecordsStandard = [];

                $http.post("../server/Server_Gunbook.aspx", data, config)
                    .success(function (data, status, headers, config) {
                        if (data.output == "OK") {
                            if (data.Records.length < 1) {
                                divStandard.style.display = "none";
                                ERRORStandard.innerHTML = "ไม่มีข้อมูล";
                            }
                            $scope.DataRecordsStandard = data.Records;
                            $('#myModalAddStandard').modal('show');
                            fnUnLoading();
                        } else {
                            fnUnLoading();
                            alert(data.MSG);
                        }
                    })
                    .error(function (data, status, header, config) { });
            }

            $scope.checkboxValue = function (itemdata) {
                $scope.clearRow();
                $scope.RecordData.GunType = itemdata.GunType;
                $scope.RecordData.GunSize = itemdata.GunSize;
                $scope.RecordData.GunBrand = itemdata.GunBrand;
                $scope.RecordData.GunBarrel = itemdata.GunBarrel;
                $scope.RecordData.GunColor = itemdata.GunColor;
                $scope.RecordData.GunOwner = itemdata.GunOwner;
                $scope.RecordData.GunRemark = itemdata.GunRemark;
                $scope.RecordData.GunRegDate = itemdata.GunRegDate;
                $scope.RecordData.GunCountry = itemdata.GunCountry;

                if (itemdata.GunMaxShot != "")
                    $scope.RecordData.GunMaxShot = parseInt(itemdata.GunMaxShot);
                if (itemdata.GunLottotal != "")
                    $scope.RecordData.GunLottotal = parseInt(itemdata.GunLottotal);

            }

            $scope.fnDeleteStandard = function (strID) {

                fnLoading();
                var data = $.param({
                    Command: 'DeleteStandard',
                    datatype: $scope.dataStandard.datatype,
                    ID: strID
                });

                $tmp_http.post("../server/Server_Gunbook.aspx", data, config)
                    .success(function (data, status, headers, config) {
                        if (data.output == 'OK') {
                            $scope.openDataStandard($scope.dataStandard.datatype, "");
                            fnUnLoading();
                        } else {
                            ERROR.innerHTML = data.MSG;
                            fnUnLoading();
                        }
                    })
                    .error(function (data, status, header, config) { });
            }

            $scope.fnSelectStandard = function (strData) {
                switch ($scope.dataStandard.datatype) {
                    case 'GunType':
                        $scope.RecordData.GunType = strData;
                        break;
                    case 'GunSize':
                        $scope.RecordData.GunSize = strData;
                        break;
                    case 'GunBrand':
                        $scope.RecordData.GunBrand = strData;
                        break;
                    case 'GunBarrel':
                        $scope.RecordData.GunBarrel = strData;
                        break;
                    case 'GunColor':
                        $scope.RecordData.GunColor = strData;
                        break;
                    case 'GunOwner':
                        $scope.RecordData.GunOwner = strData;
                        break;
                    case 'GunCountry':
                        $scope.RecordData.GunCountry = strData;
                        break;
                    default:
                }
                //$('#myModalAddStandard').modal('hide');
            }

            $scope.$on('ngRepeatFinished', function (ngRepeatFinishedEvent) {
                $('#example').DataTable();
            });

            $scope.checkIfEnterKeyWasPressed = function ($event) {
                var keyCode = $event.which || $event.keyCode;
                if (keyCode === 13) {
                 //   $scope.adddata();
               //     $scope.fnSave("0");
                    return;
                }

            };


            //========================= CalLenghtGunNo============================
            $scope.idStart = function ($event) {
                var keyDown = event.key;
                var idStrt = document.getElementById("_idStrat").value;
                $scope.calLenghtGunLottotal(idStrt + keyDown, "Start");

 
            };
            $scope.idEnd = function ($event) {
                var keyDown = event.key;
                var IdEnd = document.getElementById("_idEnd").value;
                $scope.calLenghtGunLottotal(IdEnd + keyDown, "End");

            };
            $scope.gunLott = function ($event) {
                var keyDown = event.key;
                var gunLott = document.getElementById("_gunLot").value;

                var myTable = document.getElementById('simple-table');
                var total = gunLott + parseInt(keyDown);
                 myTable.rows[$tmpIdx + 1].cells[11].innerHTML = total.replace("NaN", "");

            };
            $scope.calLenghtGunLottotal = function (gunId, inp) {
                if (inp == "Start") {
                    var IdEnd = document.getElementById("_idEnd").value;
                    if (IdEnd == "") IdEnd = 0;

                    var cal = (parseInt(IdEnd) - parseInt(gunId)) + 1;

                    if (parseInt(cal) > 0) {
                        $scope.RecordData.GunLottotal = cal;
                     }
                    else {
                        $scope.RecordData.GunLottotal = cal;
                         cal = '';
                    }

                    var myTable = document.getElementById('simple-table');
                    myTable.rows[$tmpIdx + 1].cells[11].innerHTML = cal;
 
                }
                if (inp == "End") {
                    var idStrt = document.getElementById("_idStrat").value;
                    if (idStrt == "") idStrt = 0;

                    var cal = (parseInt(gunId) - parseInt(idStrt)) + 1;

                    if (parseInt(cal) > 0) {
                        $scope.RecordData.GunLottotal = cal;
                     }

                    else {
                         $scope.RecordData.GunLottotal = cal;
                        cal = '';
                    }

                    var myTable = document.getElementById('simple-table');
                    myTable.rows[$tmpIdx + 1].cells[11].innerHTML = cal;


                }

             


            }
        //==============================================
        }
      

        function addDelRowLast() {

            var nRow = document.getElementById("simple-table").rows.length;
            var lRow = parseInt(nRow) - 1;

            document.getElementById("simple-table").deleteRow(lRow);

            $('#myModal').modal('hide');
        }

        function loadData($scope, $http, ID) {
            var data = $.param({
                Command: 'fnLoadDataImport',
                ID: ID
            });

            $http.post("../server/Server_Gunbook.aspx", data, config)
                .success(function (data, status, headers, config) {
                    if (data.output == "OK") {

                        if (ID != null)
                            document.getElementById("bookNo").disabled = true;



                        document.getElementById('bookNo').value = data.BOOKNO;
                        document.getElementById('dataTotal').value = data.DATAPTOTAL;

                        $scope.StatusPage = data.STATUS;

                        $scope.UserAuth = data.USER;
                        $scope.DataRecords = data.DATARECORDS;

                        $scope.datalistGunType = data.standardGunType;
                        $scope.datalistGunSize = data.standardGunSize;
                        $scope.datalistGunBrand = data.standardGunBrand;
                        $scope.datalistGunBarrel = data.standardGunBarrel;
                        $scope.datalistGunColor = data.standardGunColor;
                        $scope.datalistGunOwner = data.standardGunOwner;
                        $scope.datalistGunCountry = data.standardGunCountry;

                        fnUnLoading();

                    } else {
                        showmessage(data.MSG);
                    }
                })
                .error(function (data, status, header, config) { });

        }
        var tempBOOKNO;
        var tempDataTotal;
        function fnSetValue() {

            tempBOOKNO = document.getElementById('bookNo').value;
            tempDataTotal = document.getElementById('dataTotal').value;

        }
        function fnOpenImage() {
            fnSetValue();

            if (tempBOOKNO != "") {
                window.open('showimageImport.aspx?Book=' + tempBOOKNO + '&Page=1&Ver=1', '_blank');

            } else {
                alert('กรุณากรอกหมายเลขเล่ม');
                document.getElementById("bookNo").focus();
            }

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

        function openImage() {
            window.open('showimage.aspx?Book=' + document.getElementById('bookno').innerHTML + '&Page=' + document.getElementById('pageno').innerHTML + '&Ver=' + document.getElementById('pagever').innerHTML, '_blank');
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

        function fnSetDate(OPNdate) {
            try {
                $('#datereg').datepicker({
                    language: 'thai',
                    format: 'dd MM yyyy',
                    autoclose: true
                });
                var Odate = OPNdate.split(' ');

                var OPdate = Odate[0].split('/');
                var opnDT = new Date(parseInt(OPdate[2]) - 543, parseInt(OPdate[1]) - 1, parseInt(OPdate[0]));

                $('#datereg').datepicker('setDate', opnDT);
            } catch (err) {

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