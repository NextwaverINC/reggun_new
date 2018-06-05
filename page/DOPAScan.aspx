<%@ Page Title="" Language="C#" MasterPageFile="~/master/main.master" AutoEventWireup="true" CodeFile="DOPAScan.aspx.cs" Inherits="page_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div id="mainApp">
        <div class="row">

            <div class="col-lg-6">
                <div class="widget-box widget-color-blue">
                    <div class="widget-header">
                        <h5 class="widget-title">ติดตั้งโปรแกรมอัพเดตเวอร์ชันภาพสแกนสมุดนำจด</h5>
                        <div class="widget-toolbar">
                            <a href="#" data-action="collapse">
                                <i class="1 ace-icon fa fa-chevron-up bigger-125"></i>
                            </a>
                        </div>
                    </div>
                    <div class="widget-body">
                        <div class="widget-main">
                            <a href="/reggun_new/DOPAScan_program/setupDOPAScan.msi" class="btn btn-app btn-yellow  btn-block" ">
											<i class="ace-icon fa fa-download bigger-200"></i>
											ดาวน์โหลด
						 </a>
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
        var $http_gobal;
        function fnLoading() {
            document.getElementById("mainApp").style.display = "none";
            document.getElementById("loading").style.display = "";
        }
        function fnUnLoading() {
            document.getElementById("mainApp").style.display = "";
            document.getElementById("loading").style.display = "none";
        }
        function fnDownload() {
            
            fnSetLog("DOPAScan Program", "Download", "Click Download Button");
        }
 
        function fnSetLog(Menu, FN_Name, Detail) {
            var data = $.param({
                Command: 'set_log',
                Menu: Menu,
                FN_Name: FN_Name,
                Detail: Detail
            });

            $http_gobal.post("../server/Server_Gunbook.aspx", data, config)
                .success(function (data, status, headers, config) {

                })
                .error(function (data, status, header, config) { });
        }
 
     
   

    </script>
</asp:Content>

