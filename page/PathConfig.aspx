<%@ Page Title="" Language="C#" MasterPageFile="~/master/main.master" AutoEventWireup="true" CodeFile="PathConfig.aspx.cs" Inherits="page_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div id="mainApp">
        <div class="row">

            <div class="col-lg-12">
                <div class="widget-box widget-color-blue">
                    <div class="widget-header">
                        <h5 class="widget-title">ตั้งค่า
                        </h5>
                        <div class="widget-toolbar">
                            <a href="#" data-action="collapse">
                                <i class="1 ace-icon fa fa-chevron-up bigger-125"></i>
                            </a>
                        </div>
                    </div>
                    <div class="widget-body">
                        <div class="widget-main">
                                </br>
                           <div class="row">

                                <div class="col-md-4 col-sm-3 col-xs-6 align-right" style="padding-right: 0px;">
                                    <span class="text"><strong>กำหนดที่จัดเก็บรูปภาพเอกสาร &nbsp;&nbsp;:</strong></span>
                                </div>
                                <div class="col-md-5 col-sm-3 col-xs-6">
                                    <input id="imgPath" type="text" class="form-control"  style="width: 100%" />
                                </div>

 
                            </div>
                           <%-- </br>
                             <div class="row">

                                               <div class="col-md-4 col-sm-3 col-xs-6 align-right" style="padding-right: 0px;">
                                    <span class="text-right"><strong>กำหนดที่จัดเก็บPDF &nbsp;&nbsp;:</strong></span>
                                </div>
                                <div class="col-md-5 col-sm-3 col-xs-6">
                                    <input id="pdfPath" type="text" class="form-control"  style="width: 100%" />
                                </div>
                             </div>--%>

                                </br>
                            <footer>
                                <hr />
                                  
                                   <div class="row">
                                        <center> 
                                            <button class="btn btn-app btn-success btn-sm" onclick="fnReset()">
                                                คืนค่า
                                            </button>
                                  

                                            <button class="btn btn-app btn-primary btn-sm" ng-click="fnSave()" >
                                                บันทึก
                                            </button>
                             </center>
                                   </div>   
                            </footer>
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

                        tempConfig_imgPath = data.pathImage;

                        document.getElementById('imgPath').value = data.pathImage;

                        fnUnLoading();
                    })
                    .error(function (data, status, header, config) { fnUnLoading(); });
            }

            $scope.fnLoadData();

            
            $scope.fnSave = function ()  {

                var _imgPath = document.getElementById('imgPath').value;

              
                var data = $.param({
                    Command: 'SetWebConfig',
                    pathimg: _imgPath
                });

                $http.post("../server/Server_Gunbook.aspx", data, config)
                    .success(function (data, status, headers, config) {


                        fnUnLoading();
                    })
                    .error(function (data, status, header, config) { fnUnLoading(); });

            }
        }
        

        function fnReset()
        {
            document.getElementById('imgPath').value = tempConfig_imgPath;
        }
     
        

    </script>
</asp:Content>

