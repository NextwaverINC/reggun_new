<%@ Page Title="" Language="C#" MasterPageFile="~/master/main.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="page_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="mainApp">          
           <div class="row">
               <center>
               <table>
                   <tr>
                       <td><img src="../image/LOGO.gif" style="height:50px" /></td>
                       <td style="width:10px"></td>
                       <td>
                           <h4>
                            ยินดีต้อนรับเข้าสู่ระบบสืบค้นข้อมูลสมุดบัญชี<br />
                            ทำเครื่องหมายทะเบียนอาวุธปืน(นำจด)
                            </h4>

                       </td>
                   </tr>
               </table>
              </center>
              
                        
 
             </div>        
        <div class="row">
            <div class="col-xs-12">
                    <div>
                      <div class="error-container">
									<div class="well">
										<h3 class="grey lighter smaller">
											<span class="blue bigger-125">
												<i class="ace-icon fa fa-sitemap"></i>
											</span>สิทธิ์การใช้งานในระบบ
										</h3>
										<hr />
										<div>
                                              <div class="row">
									        <div class="col-sm-6">
											<ul class="list-unstyled spaced inline bigger-110 margin-15">
												<li ng-repeat="item in Data">
													<i class="ace-icon fa fa-hand-o-right blue"></i>
													{{item.desc}}
												</li>
											</ul>
                                        	</div>
                                                <%--  <div class="col-sm-6">
											<ul class="list-unstyled spaced inline bigger-110 margin-15">
												<li ng-repeat="item in Data">
													<i class="ace-icon fa fa-hand-o-right blue"></i>
													{{item.desc}}
												</li>
											</ul>
                                        	</div>--%>
                      
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

        function StartPages($scope, $http) {

            $scope.fnLoadData = function () {

                fnLoading();
                var data = $.param({
                    Command: 'LoadDetailPermission'
                });

                $http.post("../server/Server.aspx", data, config)
                    .success(function (data, status, headers, config) {

                        console.log(data.DESC);
                        $scope.Data = data.DESC;

                         window.setTimeout(initpage, 100);
                        fnUnLoading();
                    })
                    .error(function (data, status, header, config) { fnUnLoading(); });
            }

            $scope.fnLoadData();
        }

        var numPageDisplay = 100;
        var myTable;
        function initpage() {
 
        }

    </script>
</asp:Content>

