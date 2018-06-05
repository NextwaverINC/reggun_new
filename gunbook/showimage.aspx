<%@ Page Language="C#" AutoEventWireup="true" CodeFile="showimage.aspx.cs" Inherits="gunbook_showimage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="height: 100%">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
     <meta http-equiv="X-UA-Compatible" content="IE=11" /> 
    <title>รูปภาพ</title>
     

     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="../js.iviewer/test/jquery.js"></script>
    <script src="../js.iviewer/test/jqueryui.js"></script>
    <script src="../js.iviewer/test/jquery.mousewheel.min.js"></script>
    <script src="../js.iviewer/jquery.iviewer.js"></script>
    <link rel="stylesheet" href="../assets/css/bootstrap.css" />
    <script src="../Scripts/angular.min.js"></script>

    <script src="image_editor/page/js/FileSaver.js"></script>


    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="../assets/css/bootstrap.css" />
    <link rel="stylesheet" href="../assets/css/font-awesome.css" />

    <!-- page specific plugin styles -->

    <!-- text fonts -->
    <link rel="stylesheet" href="../assets/css/ace-fonts.css" />

    <!-- ace styles -->
    <link rel="stylesheet" href="../assets/css/ace.css" class="ace-main-stylesheet" />
 

    <script src="../assets/js/ace-extra.js"></script>
      



    <%--<script type="text/javascript">
        
        $(document).ready(function () {

            var iv2 = 
        });
    </script>--%>
    <link href="../js.iviewer/jquery.iviewer.css" rel="stylesheet" />
    <style>
        .viewer {
            width: 100%;
            height: 100%;
            /*border: 1px solid black;*/
            position: relative;
        }

        .wrapper {
            overflow: hidden;
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

   
<style>
/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 340px;
    height:430px;
}

/* The Close Button */
.close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}
</style>
 
</head>
<body style="height: 100%">
    <div id="mainApp" ng-app="myApp" ng-controller="StartApp" style="height: 100%">
        <div>
              
            <div class="row" style="padding: 10px; background-color: #d2d2d2;">
                <div class=" col-sm-10">
                    <div class="form-group" style="margin: 0px">

                        <table>
                            <tr>
                                <td style="width: 50px;"></td>
                                <td style="width: 150px;" class="text-right"><span class="text-right"><strong>เลขหนังสือ :</strong>&nbsp;&nbsp;</span></td>
                                <td style="width: 120px;">
                                    <input type="number" class="form-control" id="bookNo" ng-model="bookno" min="1" style="width: 100%; background-color: #f7f7f7;" />
                                </td>
                                <td style="width: 100px;" style="width: 100px;" class="text-right"><span class="text-right"><strong>หน้า :</strong>&nbsp;&nbsp;</span></td>
                                <td style="width: 120px;">
                                    <input type="number" class="form-control" id="pageNo" ng-model="pageno" min="1" style="width: 100%; background-color: #f7f7f7;" />
                                </td>
                                <td style="width: 100px;" class="text-right"><span class="text-right"><strong>เวอร์ชั่น :</strong>&nbsp;&nbsp;</span></td>
                                <td style="width: 100px;">
                                    <input type="number" class="form-control" id="pageVer" ng-model="pagever" min="1" style="width: 100%; background-color: #f7f7f7;" />
                                </td>

                                <td style="width: 5px"></td>
                                <td class="text-right" id="Search"></td>
                               <%-- <td style="width: 100px;" class="text-right">
                                    <button class="btn btn-info" style="float: right; border: 0px;" ng-click="fnOpenImage()">
                                        ดูรูปภาพ
                                    </button>
                                </td>--%>
                                <td style="width: 5px"></td>
                                <td class="text-right">

                           <button type="button" class="btn btn-info" style="float: right; border: 0px;" id="myBtn">พิมพ์</button>

                                <td style="width: 5px"></td>
                                <td class="text-right">
                                    <a class="btn btn-info"  onclick="fnDownload()" style="float: right; border: 0px;" id="dowloadIMG">ดาวน์โหลด
                                    </a>
                 
                                <td style="width: 5px"></td>

                                <td class="text-right" id="EditImg"></td>
                                <td style="width: 5px"></td>
                                <td class="text-right">
                                    <button class="btn btn-info" style="float: right; border: 0px;" ng-click="reportImg()">
                                        รายงานภาพไม่ได้คุณภาพ
                                    </button>
                                </td>
                                <%-- <td class="text-right">
                                 <a href="#" id="id-btn-dialog2" class="btn btn-info btn-sm">Confirm Dialog</a>
                                     </td>--%>
 
                        
                            </tr>

                          
                        </table>
                        <%-- <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>--%>


<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
<%--    <span class="close">&times;</span>--%>
         <div class="modal-header" >
       <%--   <button type="button" class="close" data-dismiss="modal">&times;</button>--%>
          <h4 class="modal-title"><i class="ace-icon fa fa-cog bigger-120"></i> กำหนดการพิมพ์</h4>
        </div>
     <table style="width:100%">
                       <tr><td colspan="5" style="height:20px"></td></tr>
                       <tr>
                            <div class="radio">
                                    <label>
                                        <input name="form-field-radio" type="radio" class="ace ace input-sm" id="rd1" />
                                        <span class="lbl bolder control-label padding-right"> &nbsp; ไม่กำหนดลายน้ำ</span>
                                    </label>
                                </div>
                         
                       </tr>
                       <tr><td colspan="5" style="height:10px"></td></tr>
                       <tr>
                           <div class="radio">
                                    <label>
                                        <input name="form-field-radio" type="radio" class="ace ace input-sm" id="rd2" />
                                        <span class="lbl bolder control-label padding-right"> &nbsp; กำหนดลายน้ำตามปี</span>
                                    </label>
                                </div>
                       </tr>
                       <tr><td colspan="5" style="height:10px"></td></tr>
                       <tr>
                            <hr/>
                             <div class="radio">
                                    <label>
                                        <input name="form-field-radio" type="radio" class="ace ace input-sm" id="rd3" />
                                        <span class="lbl bolder control-label padding-right"> &nbsp; ระบุหน่วยงาน</span>
                                    </label>
                                </div>
        
                               <select id="dep_name" class="multiselect" style="width:100%">
<%--                                   <option value="">-- โปรดเลือก --</option>--%>
								    <option ng-value="x.DepName" ng-repeat="x in DEPNAME">
                                       {{ x.DepName }}
								    </option>										
							    </select>
                       </tr>
                        <tr><td colspan="5" style="height:2px"></td></tr>
                       <tr>
                        
                             <div class="radio">
                                    <label>
                                        <input name="form-field-radio" type="radio" class="ace ace input-sm" id="rd4" />
                                        <span class="lbl bolder control-label padding-right"> &nbsp; กลุ่มอื่นๆ</span>
                                    </label>
                                </div>
        
                               <select id="otherGroup" class="multiselect" style="width:100%">
<%--                                   <option value="">-- โปรดเลือก --</option>--%>
								    <option ng-value="x.otherName" ng-repeat="x in OTHERNAME">
                                       {{ x.otherName }}
								    </option>										
							    </select>
                       </tr>
               
                   </table>
                 <div>
                    <div class="modal-footer">
             <button id="btnClose" type="button" class= "btn btn-danger"  data-dismiss="modal" >	<i class="ace-icon fa fa-remove  bigger-160"></i>ยกเลิก</button>
            <button type="button" class="btn btn-primary" data-dismiss="modal" ng-click="fnPrint()"><i class="ace-icon fa fa-print bigger-160"></i>พิมพ์</button>

        </div>
           </div>
  
  </div>

</div>
</div>
                    </div>
                <div class="col-sm-2">
                   <label id="ERROR" style="color: red"></label>
                    </div>
                    </div>
                </div>
      
                            <div class="row">
                                <div  class="col-sm-12 text-center" style = "background-color:#d2d2d2">
                                       <label id="lbMask" style="color:white"></label>
                                </div>
                            </div>
        

        <div class="wrapper" style="height: calc(100vh - 80px);">
            <div id="viewer2" class="viewer " style="width: 100%; background-color: #d2d2d2;"></div>
           </div>
 
        <div   id="divViewer" class="wrapper" style="height: 1px">
            <div id="viewerWM" class="viewer " style="width: 100%; background-color: #fff;"></div>
        </div>
        
        <div   id="divViewer3" class="wrapper" style="height: 1px">
            <div id="viewerWM3" class="viewer " style="width: 100%; background-color: #fff;"></div>
        </div>
            
        <div   id="divViewer4" class="wrapper" style="height: 1px">
            <div id="viewerWM4" class="viewer " style="width: 100%; background-color: #fff;"></div>
        </div>

       <div   id="divViewerMarking" class="wrapper" style="height: 1px">
            <div id="viewerWMrMarking" class="viewer " style="width: 100%; background-color: #fff;"></div>
        </div>
        <%--<img src="data:image/png;base64,<% =imgdata %>" style="width: 100%" />--%>
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
  </div>    </div>
    <%--<script src="../assets/js/bootstrap.js"></script>--%>
 
    <script>
        // Get the modal
        var modal = document.getElementById('myModal');

        // Get the button that opens the modal
        var btn = document.getElementById("myBtn");

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];


        var span = document.getElementById("btnClose");

        // When the user clicks the button, open the modal 
        btn.onclick = function () {
            modal.style.display = "block";
        }

        // When the user clicks on <span> (x), close the modal
        span.onclick = function () {
            modal.style.display = "none";
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
</script>

    <script>
 

        var tmp_src_img;
        function fnLoadEditImage(fnOutputUpload,fnLoadImage) {
            var data = $.param({
                Command: 'GetEditImage',
                bookno: getParamValue("Book"),
                pageno: getParamValue("Page"),
                pagever: getParamValue("Ver")

            });

            $http_gobal.post("../server/Server_Gunbook.aspx", data, config)
                .success(function (data, status, headers, config) {
                    if (data.output == 'OK') {                        

                        var EditImage = "data:image/png;base64," + data.imgStr;
                        fnLoadImage(EditImage);
                        
                    } else {
                        fnOutputUpload('ข้อผิดพลาด : ' + data.message);
                    }
                })
                .error(function (data, status, header, config) { });
        }
  /*      function fnSaveEditImage(blop, dataURL, fnOutputUpload) {           
            var bookno = getParamValue("Book");
            var pageno = getParamValue("Page");
            var pagever = getParamValue("Ver");
       
            var URL = "../server/Server_Gunbook.aspx?Command=save_edit_image&book=" + bookno + "&page=" + pageno + "&ver=" + pagever;
            var data = encodeURIComponent(dataURL);
            var configs = { headers: { 'Content-Type': 'application/upload' } }
            $http_gobal.post(URL, blop, configs)
                .success(function (data, status, headers, configs) {
                    if (data.output == 'OK') {
                        fnOutputUpload('บันทึกหมายเหตุเรียบร้อยแล้ว');
                        fnSetLog("หน้าต่างจัดการหมายเหตุ", "SaveNoteImage", "บันทึก การแก้ไขรูปภาพ-จัดการหมายเหตุ");
                    } else {
                        fnOutputUpload('ข้อผิดพลาด : ' + data.message);
                    }
                })
                .error(function (data, status, header, config) { });            
        }*/


        var $tmp_http;
        function fnSaveEditImage(blop, dataURL, fnOutputUpload) {

            var bookno = getParamValue("Book");
            var pageno = getParamValue("Page");
            var pagever = getParamValue("Ver");
            var _base64 = dataURL.replace("data:image/png;base64,", "");

            var data = $.param({
                Command: 'save_edit_image',
                bookno: bookno,
                pageno: pageno,
                pagever: pagever,
                imgBase64: _base64
            });

            $tmp_http.post("../server/Server_Gunbook.aspx", data, config)
                .success(function (data, status, headers, config) {
                    if (data.output == 'OK') {
                        fnOutputUpload('บันทึกหมายเหตุเรียบร้อยแล้ว');
                        fnSetLog("หน้าต่างจัดการหมายเหตุ", "SaveNoteImage", "บันทึกการแก้ไขรูปภาพ เล่ม " + bookno + " หน้า " + pageno + " เวอร์ชัน " + pagever);
                        return;
                    } else {
                        fnOutputUpload('ข้อผิดพลาด : ' + data.message);
                    }
                })
                .error(function (data, status, header, config) { });
        }
        function fnDeleteImageEdit() {
 
            var bookno = getParamValue("Book");
            var pageno = getParamValue("Page");
            var pagever = getParamValue("Ver");

            var data = $.param({
                Command: 'delete_edit_image',
                bookno: bookno,
                pageno: pageno,
                pagever: pagever,
            });

            $tmp_http.post("../server/Server_Gunbook.aspx", data, config)
                .success(function (data, status, headers, config) {
                    if (data.output == 'OK') {
                   //     fnOutputUpload('ลบหมายเหตุเรียบร้อยแล้ว');
                        alert('ลบหมายเหตุเรียบร้อยแล้ว');
                        fnSetLog("หน้าต่างจัดการหมายเหตุ", "DeleteImageNote", "ลบรูปภาพที่ทำหมายเหตุ เล่ม " + bookno + " หน้า " + pageno + " เวอร์ชัน " + pagever);
                        return;
                    } else {
                        fnOutputUpload('ข้อผิดพลาด : ' + data.message);
                    }
                })
                .error(function (data, status, header, config) { });
        }



        var tmp_src_img_orig;
        function fnEditImg() {
            var elm = {};
            var elm2 = {};
            var img_tmp = "";
            var img_tmp2 = "";

         if (tmp_imgMarking == "true")
            {
                 elms = document.getElementById("divViewerMarking").getElementsByTagName("img");
                 elm2 = document.getElementById("viewer2").getElementsByTagName("img");

                 for (var i = 0; i < elms.length; i++) {
                     img_tmp = elms[i].src;
                 }

                 for (var i = 0; i < elm2.length; i++) {
                     img_tmp2 = elm2[i].src;
                 }

                 tmp_src_img = img_tmp;
                 tmp_src_img_orig = img_tmp2;
            }     
            else{
                elms = document.getElementById("viewer2").getElementsByTagName("img");

                for (var i = 0; i < elms.length; i++) {
                    img_tmp = elms[i].src;
                }
 
                tmp_src_img = img_tmp;
                tmp_src_img_orig = img_tmp;
            }


            //elms = document.getElementById("viewer2").getElementsByTagName("img");

            //for (var i = 0; i < elms.length; i++) {
            //    img_tmp = elms[i].src;
            //}

           
            tmp_src_img = img_tmp;

            fnSetLog("หน้าต่างจัดการหมายเหตุ", "NoteImage", "แก้ไขรูปภาพ-จัดการหมายเหตุ");
            var win = window.open("image_editor/page/index.html");
            //var win = window.open("image_editor/examples/mobile.html");

        }
 
        function fnPrintTool(BOOKNO, PAGENO, PAGEVER) {

         fnSetLog("แสดงข้อมูลภาพสมุดนำจด", "Print", "สั่งพิมพ์เอกสาร เล่มที่ " + BOOKNO + " หน้า " + PAGENO + " เวอร์ชัน " + PAGEVER);
            var elm = {};

            var elms = document.getElementById("viewer2").getElementsByTagName("img");
            if (elm==null) {
                alert("Stop"); 
            }
            var img_tmp = "";
            for (var i = 0; i < elms.length; i++) {
                img_tmp = elms[i].src;
            }

            console.log(elms);
            console.log('=================');

            var mywindow = window.open('', 'PRINT', 'height=600,width=800');

            mywindow.document.write('<html>');
            mywindow.document.write('<head><title>กรมการปกครอง</title></head><body >');
            mywindow.document.write('<img src="' + img_tmp + '" style="width:100%"/>');
            mywindow.document.write('</body></html>');
            mywindow.document.close(); // necessary for IE >= 10
            mywindow.focus(); // necessary for IE >= 10*/

            mywindow.print();
            mywindow.close();

            return true;

        }
        var supportingFileAPI = !!(window.File && window.FileList && window.FileReader);

        function fnDownload() {

            var BOOKNO = getParamValue("Book");
            var PAGENO = getParamValue("Page");
            var PAGEVER = getParamValue("Ver");
 

            fnSetLog("แสดงข้อมูลภาพสมุดนำจด", "Download", "ดาวน์โหลดเอกสาร เล่มที่ " + BOOKNO + " หน้า " + PAGENO + " เวอร์ชัน" + PAGEVER);


            var imageName = tmp_bookYear;
            var dataURL = document.getElementById('dowloadIMG').href;
            var blob, type, w;


            if (supportingFileAPI) {
                blob = base64ToBlob(dataURL);
                type = blob.type.split('/')[1];
                if (imageName.split('.').pop() !== type) {
                    imageName += '.' + type;
                }
                // Library: FileSaver - saveAs
                saveAs(blob, imageName); // eslint-disable-line
            } else {
                alert('This browser needs a file-server');
                w = window.open();
                w.document.body.innerHTML = '<img src=' + dataURL + '>';
            }
        }
        var rImageType = /data:(image\/.+);base64,/;
        function base64ToBlob(data) {
            var mimeString = '';
            var raw, uInt8Array, i, rawLength;

            raw = data.replace(rImageType, function (header, imageType) {
                mimeString = imageType;

                return '';
            });

            raw = atob(raw);
            rawLength = raw.length;
            uInt8Array = new Uint8Array(rawLength); // eslint-disable-line

            for (i = 0; i < rawLength; i += 1) {
                uInt8Array[i] = raw.charCodeAt(i);
            }

            return new Blob([uInt8Array], { type: mimeString });
        }
        function fnLoading() {
            document.getElementById("mainApp").style.display = "none";
            document.getElementById("loading").style.display = "";
        }
        function fnUnLoading() {
            document.getElementById("mainApp").style.display = "";
            document.getElementById("loading").style.display = "none";
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
        var $ = jQuery;

        var img_base64_waterMask;
        var $scope_gobal;
        var $http_gobal;
        var data_gobal;
        var column_gobal;
        var tmp_grp_id;
        var img_base64;
        var app = angular.module('myApp', []);
        var config = { headers: { 'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;' } }
        var tmp_noimg;
        var tmp_bookYear;
        var tmp_imgMarking;
        app.controller('StartApp', StartApp);
        function StartApp($scope, $http) {  //---------------------------------START APP----
            $('#rd1').attr("checked", "checked");
            //$('#divViewer').hide();
         $('#divViewerMarking').hide();
            var BOOKNO = getParamValue("Book");
            var PAGENO = getParamValue("Page");
            var PAGEVER = getParamValue("Ver");
            var URL = "";
            $scope_gobal = $scope;
            $http_gobal = $http;
            $tmp_http = $http;


             fnLoading();
            fnLoadListWaterMask($scope, $http);
 

            $scope.fnPrint = function () {  //------------------------ PRINNT ON WATER MASK --------------------


                var BOOKNO = getParamValue("Book");
                var PAGENO = getParamValue("Page");
                var PAGEVER = getParamValue("Ver");
                var URL = "";
                var BOOKNO = getParamValue("Book");
                var DEPNAME = getParamValue("Book");
                var dep_name = document.getElementById('dep_name').value;
                var otherGroup = document.getElementById('otherGroup').value;
                //   fnSetLog("แสดงข้อมูลภาพสมุดนำจด", "Print", "สั่งพิมพ์เอกสาร เล่ม "+BOOKNO+ " หน้า "+PAGENO+ " เวอร์ชัน "+PAGEVER);stateWM
                

                if ($("#rd1").is(':checked')) {
                    fnPrintTool(BOOKNO, PAGENO, PAGEVER);
                    return;
                }
                if ($("#rd2").is(':checked')) {
                    var data = $.param({
                        Command: 'GetimWaterMask',
                        bookNo: BOOKNO,
                        pageNo: PAGENO,
                        pageVer: PAGEVER,
                        depname: dep_name,
                        otherG: "",
                        state: "1"
                    });

                    $http.post("../server/Server_Gunbook.aspx", data, config)
                        .success(function (data, status, headers, config) {

                            if (data.MSG == "ไม่มีลายน้ำ") {
                                tmp_noimg = data.MSG;
                            }
                            else {
                                $("#viewerWM").iviewer(
                                    {
                                        src: "data:image/png;base64," + data.base64img
                                    });
                            }
                          
                          


                        })
                        .error(function (data, status, header, config) { });

                    //--------------------------- Print Dialog -------------------------
                    //var stateWM = document.getElementById('stateWM').value;
                    //if (stateWM != "F") {
 
                    fnLoading();
                        setTimeout(function () {
                            if (tmp_noimg != "ไม่มีลายน้ำ") {
                            var elm = {};
                            var elms = document.getElementById("viewerWM").getElementsByTagName("img");
                            if (elm == null) {
                                alert("Stop");
                            }
                            var img_tmp = "";
                            for (var i = 0; i < elms.length; i++) {
                                img_tmp = elms[i].src;
                            }

                            fnSetLog("แสดงข้อมูลภาพสมุดนำจด", "Print", "สั่งพิมพ์เอกสาร เล่มที่ " + BOOKNO + " หน้า " + PAGENO + " เวอร์ชัน " + PAGEVER);

                            
                                var mywindow = window.open('', 'PRINT', 'height=600,width=800');

                                mywindow.document.write('<html>');
                                mywindow.document.write('<head><title>กรมการปกครอง</title></head><body>');
                                mywindow.document.write('<img src="' + img_tmp + '" style="width:100%"/>');
                                mywindow.document.write('</body></html>');


                                mywindow.document.close(); // necessary for IE >= 10
                                mywindow.focus(); // necessary for IE >= 10*/

                                mywindow.print();
                                mywindow.close();
                                
                            }
                            else {
                                alert(tmp_noimg);
                            }
                            fnUnLoading();

                    }, 6000);
                    
                   // }
                       


                    //---------------------------------------------
                }
                if ($("#rd3").is(':checked')) {
                    {
                        if (dep_name == "") {
                            return;
                        }

                        var data = $.param({
                            Command: 'GetimWaterMask',
                            bookNo: BOOKNO,
                            pageNo: PAGENO,
                            pageVer: PAGEVER,
                            depname: dep_name,
                            otherG: "",
                            state: "2"
                        });
                        $http.post("../server/Server_Gunbook.aspx", data, config)
                            .success(function (data, status, headers, config) {

                                $("#viewerWM3").iviewer(
                                    {
                                        src: "data:image/png;base64," + data.base64img
                                    });

                            })
                            .error(function (data, status, header, config) { });


                        //--------------------------- Print Dialog -------------------------
                        fnLoading();
                        setTimeout(function () {
                            var elm = {};

                            var elms = document.getElementById("viewerWM3").getElementsByTagName("img");
                            if (elm == null) {
                                alert("Stop");
                            }
                            var img_tmp = "";
                            for (var i = 0; i < elms.length; i++) {
                                img_tmp = elms[i].src;
                            }

                            fnSetLog("แสดงข้อมูลภาพสมุดนำจด", "Print", "สั่งพิมพ์เอกสาร เล่มที่ " + BOOKNO + " หน้า " + PAGENO + " เวอร์ชัน " + PAGEVER);

                            var mywindow = window.open('', 'PRINT', 'height=600,width=800');

                            mywindow.document.write('<html>');
                            mywindow.document.write('<head><title>กรมการปกครอง</title></head><body >');
                            mywindow.document.write('<img src="' + img_tmp + '" style="width:100%"/>');
                            mywindow.document.write('</body></html>');

                            mywindow.document.close(); // necessary for IE >= 10
                            mywindow.focus(); // necessary for IE >= 10*/

                            mywindow.print();
                            mywindow.close();
                            fnClearImg();
                            fnUnLoading();

                            return true;

                        }, 6000);
                        //---------------------------------------------
                    }


                    // fnUnLoading();


                }
                if ($("#rd4").is(':checked')) {
                    
                        if (otherGroup == "") {
                            return;
                        }

                        var data = $.param({
                            Command: 'GetimWaterMask',
                            bookNo: BOOKNO,
                            pageNo: PAGENO,
                            pageVer: PAGEVER,
                            depname: "",
                            otherG: otherGroup,
                            state: "3"
                        });
                        $http.post("../server/Server_Gunbook.aspx", data, config)
                            .success(function (data, status, headers, config) {

                                $("#viewerWM4").iviewer(
                                    {
                                        src: "data:image/png;base64," + data.base64img
                                    });

                            })
                            .error(function (data, status, header, config) { });


                        //--------------------------- Print Dialog -------------------------
                        fnLoading();
                        setTimeout(function () {
                            var elm = {};

                            var elms = document.getElementById("viewerWM4").getElementsByTagName("img");
                            if (elm == null) {
                                alert("Stop");
                            }
                            var img_tmp = "";
                            for (var i = 0; i < elms.length; i++) {
                                img_tmp = elms[i].src;
                            }

                            fnSetLog("แสดงข้อมูลภาพสมุดนำจด", "Print", "สั่งพิมพ์เอกสาร เล่มที่ " + BOOKNO + " หน้า " + PAGENO + " เวอร์ชัน " + PAGEVER);

                            var mywindow = window.open('', 'PRINT', 'height=600,width=800');

                            mywindow.document.write('<html>');
                            mywindow.document.write('<head><title>กรมการปกครอง</title></head><body >');
                            mywindow.document.write('<img src="' + img_tmp + '" style="width:100%"/>');
                            mywindow.document.write('</body></html>');

                            mywindow.document.close(); // necessary for IE >= 10
                            mywindow.focus(); // necessary for IE >= 10*/

                            mywindow.print();
                            mywindow.close();
                            fnClearImg();
                            fnUnLoading();

                            return true;

                        }, 6000);
                        //---------------------------------------------
                    }
            }
   
            $scope.bookno = parseInt(getParamValue("Book"));
            $scope.pageno = parseInt(getParamValue("Page"));
            $scope.pagever = parseInt(getParamValue("Ver"));

            fnLoading();

                 var BOOKNO = getParamValue("Book");
                    var PAGENO = getParamValue("Page");
                    var PAGEVER = getParamValue("Ver");
                    var URL = "";
 

            var data = $.param({
                Command: 'GetImage',
                bookno: getParamValue("Book"),
                pageno: getParamValue("Page"),
                pagever: getParamValue("Ver")

            });

            $http.post("../server/Server_Gunbook.aspx", data, config)
                .success(function (data, status, headers, config) {
                  
                    if (data.output == 'OK') {

                        document.getElementById('dowloadIMG').href = "data:image/png;base64," + data.imgStr;

                        tmp_bookYear = data.bookYear;
                    
                        var perId = getParamValue("perId")

                        if (perId == "3" || perId == null || perId == "null") {
                            document.getElementById('EditImg').innerHTML = "<a class='btn btn-info' style='float: right; border: 0px; ' onclick='fnEditImg()'>ทำหมายเหตุ</a>";
                            document.getElementById('Search').innerHTML = "<a class='btn btn-info' style='float: right; border: 0px; '  onclick='fnOpenImage()'>ดูรูปภาพ</a>";

                          

                            if (data.MSG =="OK") {
                                $("#divViewerMarking").iviewer(
                                    {
                                        src: "data:image/png;base64," + data.imgMask
                                    });
                                tmp_imgMarking = "true";
                                lbMask.innerHTML = "มีการทำหมายเหตุ คลิกที่ปุ่ม <ทำหมายเหตุ> เพื่อเข้าดูรูปภาพ";

                                lbMask.style.backgroundColor = "mediumseagreen";
                               
                            }
                            else {
                                tmp_imgMarking = "false";

                            }  
    
                         }

                        else {
                            document.getElementById('bookNo').disabled = 'true';
                            document.getElementById('pageNo').disabled = 'true';
                            document.getElementById('pageVer').disabled = 'true';
                        }
                        fnUnLoading();


                        //  btoa(data.imgStr);
                        fnSetLog("แสดงภาพสมุดนำจด", "View", "ดูภาพสมุดนำจด เล่มที่ " + BOOKNO + " หน้า " + PAGENO + " เวอร์ชัน " + PAGEVER);
                        tmp_src_img = data.imgPath;
                        img_base64 = data.imgStr; 

                        //   document.getElementById('dowload_img').href = "data:image/png;base64," + data.imgStr;
                        $("#viewer2").iviewer(
                            {
                                src: "data:image/png;base64," + data.imgStr
                            });

    
                    } else {
                        fnUnLoading();
                        if (perId == "3" || perId == null || perId == "null") {
                            document.getElementById('EditImg').innerHTML = "<a class='btn btn-info' style='float: right; border: 0px; ' onclick='fnEditImg()'>ทำหมายเหตุ</a>";
                            document.getElementById('Search').innerHTML = "<a class='btn btn-info' style='float: right; border: 0px; '  onclick='fnOpenImage()'>ดูรูปภาพ</a>";
                        }
                        alert(data.MSG);
                    }
                })
                .error(function (data, status, header, config) { });

            //$scope.fnOpenImage = function () {
            //    var perId = getParamValue("perId")
            //    fnSetLog("แสดงภาพสมุดนำจด", "Search", "ค้นหาเอกสาร เล่มที่ " + BOOKNO + " หน้า " + PAGENO + " เวอร์ชัน" + PAGEVER);
            //    window.open('showimage.aspx?Book=' + $scope.bookno + '&Page=' + $scope.pageno + '&Ver=' + $scope.pagever + '&perId=' + perId, '_self');
            //}
            $scope.reportImg = function () {
                $scope.bookno = parseInt(getParamValue("Book"));
                $scope.pageno = parseInt(getParamValue("Page"));

                fnLoading();
                var data = $.param({
                    Command: 'ReportImage',
                    bookno: getParamValue("Book"),
                    pageno: getParamValue("Page")
                });

                $http.post("../server/Server_Gunbook.aspx", data, config)
                    .success(function (data, status, headers, config) {
                        if (data.output == 'OK') {
                            fnSetLog("แสดงข้อมูลภาพสมุดนำจด", "Report", "รายงานภาพไม่ได้คุณภาพ เล่มที่ " + getParamValue("Book") + " หน้า " + getParamValue("Page") + " เวอร์ชัน " + getParamValue("Ver"));
                            fnUnLoading();
                            alert("รายงานภาพสำเร็จ");
                        } else {
                            fnUnLoading();
                            alert(data.MSG);
                        }
                    })
                    .error(function (data, status, header, config) { });
            }
        }
        function fnOpenImage() {

            var BOOKNO = document.getElementById('bookNo').value;
            var PAGENO = document.getElementById('pageNo').value;
            var PAGEVER = document.getElementById('pageVer').value;
            var perId = getParamValue("perId")

            fnSetLog("แสดงภาพสมุดนำจด", "Search", "ค้นหาเอกสาร เล่มที่ " + BOOKNO + " หน้า " + PAGENO + " เวอร์ชัน" + PAGEVER);
            window.open('showimage.aspx?Book=' + BOOKNO + '&Page=' + PAGENO + '&Ver=' + PAGEVER + '&perId=' + perId, '_self');
        }
        function fnLoadListWaterMask($scope, $http) {
            var data = $.param({
                Command: 'GetLoadDataWaterMaskList'
            });

            $http.post("../server/Server_Gunbook.aspx", data, config)
                .success(function (data, status, headers, config) {


                    $scope.DEPNAME = data.dep;
                    $scope.OTHERNAME = data.other;

                    if (data.MSG1 == "ไม่มีลายน้ำ") {
                        document.getElementById("rd3").disabled = true;
                    }
                    if (data.MSG2 == "ไม่มีลายน้ำ") {
                        document.getElementById("rd4").disabled = true;
                    }
                    if (data.pState == "true") {
                        document.getElementById("rd2").disabled = true;
                        document.getElementById("rd3").disabled = true;
                        document.getElementById("rd4").disabled = true;
                    }
 
                    //var ID = getParamValue("ID");

                    //if (ID != null && ID != "") {
                    //    loadData($scope, $http, ID);
                    //} else {
                    //    fnUnLoading();
                    //}
                })
                .error(function (data, status, header, config) { });

        }
        function fnClearImg() {
            var BOOKNO = getParamValue("Book");
            var PAGENO = getParamValue("Page");
            var PAGEVER = getParamValue("Ver");
            window.open('showimage.aspx?Book=' + BOOKNO + '&Page=' + PAGENO + '&Ver=' + PAGEVER,'_self');
        }
        function getParamValue(name) {
            var url = location.href;
            name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
            var regexS = "[\\?&]" + name + "=([^&#]*)";
            var regex = new RegExp(regexS);
            var results = regex.exec(url);
            return results == null ? null : results[1];
        }
    </script>
</body>
</html>
