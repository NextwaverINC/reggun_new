<%@ Page Language="C#" AutoEventWireup="true" CodeFile="searchImgGun.aspx.cs" Inherits="api_searchImgGun" %>

<!DOCTYPE html>
 
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../js.iviewer/test/jquery.js"></script>
    <script src="../js.iviewer/test/jqueryui.js"></script>
    <script src="../js.iviewer/test/jquery.mousewheel.min.js"></script>
    <script src="../js.iviewer/jquery.iviewer.js"></script>
    <script>
        function getParamValue(name) {
            var url = location.href;
            name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
            var regexS = "[\\?&]" + name + "=([^&#]*)";
            var regex = new RegExp(regexS);
            var results = regex.exec(url);
            return results == null ? null : results[1];
        }
        function fnLoadImage() {
            fnLoading();
            var bookno = getParamValue("Book");
            var pageno = getParamValue("Page");
            var pagever = getParamValue("Ver");



            var http = new XMLHttpRequest();
            var url = "../server/Server_Gunbook.aspx";
            var params = "Command=API_getRecord&GunRegID=" + getParamValue("GunRegID");
            http.open("POST", url, true);

            //Send the proper header information along with the request
            http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

            http.onreadystatechange = function () {//Call a function when the state changes.
                if (http.readyState == 4 && http.status == 200) {
                    var data = http.responseText;

                    //document.getElementById('dowload_img').href = "data:image/png;base64," + data;
                    $("#viewer2").iviewer(
                        {
                            src: "data:image/png;base64," + data
                        });
                    fnUnLoading();
                }
            }
            http.send(params);
        }
        function fnLoading() {
            document.getElementById("mainApp").style.display = "none";
            document.getElementById("loading").style.display = "";
        }
        function fnUnLoading() {
            document.getElementById("mainApp").style.display = "";
            document.getElementById("loading").style.display = "none";
        }
        function fnPrint() {

            var elm = {};
            var elms = document.getElementById("viewer2").getElementsByTagName("img");
            var img_tmp = "";
            for (var i = 0; i < elms.length; i++) {
                img_tmp = elms[i].src;
            }

            var mywindow = window.open('', 'PRINT', 'height=600,width=800');

            mywindow.document.write('<html>');
            mywindow.document.write('</head><body >');
            mywindow.document.write('<img src="' + img_tmp + '" style="width:100%"/>');
            mywindow.document.write('</body></html>');

            mywindow.document.close(); // necessary for IE >= 10
            mywindow.focus(); // necessary for IE >= 10*/

            mywindow.print();
            mywindow.close();

            return true;

        }
        function fnDownload() {

            var elm = {};
            var elms = document.getElementById("viewer2").getElementsByTagName("img");
            var img_tmp = "";
            for (var i = 0; i < elms.length; i++) {
                img_tmp = elms[i].src;
            }

            var url = img_tmp.replace(/^data:image\/[^;]+/, 'data:application/octet-stream');
            window.open(url);
        }
    </script>
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

        .button {
            background-color: #4CAF50; /* Green */
            border: none;
            color: black;
            padding: 16px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            -webkit-transition-duration: 0.4s; /* Safari */
            transition-duration: 0.4s;
            cursor: pointer;
        }
        .button2 {
            background-color: white; 
            color: black; 
            border: 2px solid #008CBA;
        }

        .button2:hover {
            background-color: #008CBA;
            color: white;
        }

        .button3 {
            background-color: white; 
            color: black; 
            border: 2px solid #4CAF50;
        }

        .button3:hover {
            background-color: #4CAF50;
            color: white;
        }
    </style>
</head>
<body onload="fnLoadImage()" style="margin:0px">
    <form id="mainApp" runat="server">       
        <div class="wrapper" style="height: calc(100vh - 80px);">
            <div id="viewer2" class="viewer" style="width: 100%; background-color: #d2d2d2;"></div>
        </div>
       <%--  <div style="width:100%">
            <a class="button button2" style="float: left" id="dowload_img" download="image.png" onclick="fnDownload()">
                Download
            </a>

            <a class="button button3" style="float: left" onclick="fnPrint()">
                Print
            </a>
        </div>    --%>
    </form>
    <div id="loading" style="display: none; margin-top: 50px">
        <center>            
            <h1>                    
                อยู่ระหว่างประมวลผลโปรดรอ...
            </h1>
        </center>
    </div>
</body>
</html>