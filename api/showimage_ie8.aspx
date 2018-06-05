<%@ Page Language="C#" AutoEventWireup="true" CodeFile="showimage_ie8.aspx.cs" Inherits="api_showimage_ie8" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-874">
    <script src="../js.iviewer/test/jquery.js"></script>
    <script src="../js.iviewer/test/jqueryui.js"></script>
    <script src="../js.iviewer/test/jquery.mousewheel.min.js"></script>
    <script src="../js.iviewer/jquery.iviewer.js"></script>
    
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
    <script>
        function getParamValue(name) {
            var url = location.href;
            name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
            var regexS = "[\\?&]" + name + "=([^&#]*)";
            var regex = new RegExp(regexS);
            var results = regex.exec(url);
            return results == null ? null : results[1];
        }
        
        function fnLoad() {
            var Value = document.getElementById("<%=txbGunRegID.ClientID%>").value;
            var Value = document.getElementById("<%=txbPid.ClientID%>").value;
            var Value = document.getElementById("<%=txbSn.ClientID%>").value;
            if (Value == "") {
                document.getElementById("<%=txbGunRegID.ClientID%>").value = getParamValue("GunRegID");
                document.getElementById("<%=txbPid.ClientID%>").value = getParamValue("pid");
                document.getElementById("<%=txbSn.ClientID%>").value = getParamValue("sn");
                document.getElementById("<%=btnStart.ClientID%>").click();
            }
        }
    </script>
</head>
<body style="margin:0px" onload="fnLoad()">
    <form id="mainApp" runat="server">
        <asp:Image ID="Image1" runat="server" style="width:100%;height:100%"/>
        <div style="visibility:hidden">
            <asp:TextBox ID="txbGunRegID" runat="server"></asp:TextBox>
            <asp:TextBox ID="txbPid" runat="server"></asp:TextBox>
            <asp:TextBox ID="txbSn" runat="server"></asp:TextBox>
                <asp:Button ID="btnStart" runat="server" Text="Start" OnClick="btnStart_Click" />
        </div>
    </form>    
</body>
</html>
