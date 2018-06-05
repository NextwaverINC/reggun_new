<%@ Page Language="C#" AutoEventWireup="true" CodeFile="open_pdf.aspx.cs" Inherits="page_open_pdf" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src="../assets/js/jquery.js"></script>

    <script type="text/javascript">
        function Confirm() {
            if (confirm("Close Window?")) {
                window.close();
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <h3 style="color: #0000FF; text-align: center">Open PDF files</h3>
        <div style="color: red; text-align: center">
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </div>
    </form>
</body>
</html>
