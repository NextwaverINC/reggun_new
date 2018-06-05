using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class api_showimage_ie8 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        //if (!Page.IsPostBack)
        //{
        //    fnSaveLogUser("TEST","API ข้อมูลภาพสมุดนำจด", "ShowImage", "แสดงข้อมูลภาพสมุดนำจด", true);
        //}
    }
    private void fnSaveLogUser(string user,string Menu, string Process, string Detail, bool Result)
    {
        //  UserProfile up = UserProfile.getProfile();
     
        GRB_WebService.GRB_WebService GRB_ws = new GRB_WebService.GRB_WebService();
        GRB_ws.logUser(user, Menu, Process, Result, Detail);
    }
    protected void btnStart_Click(object sender, EventArgs e)
    {
        //Image1
        string GunRegID = txbGunRegID.Text;
        string pid = txbPid.Text;
        string sn = txbSn.Text;

        if (pid == "") {
            string result = "ไม่สามารถค้นหาภาพสมุดนำจดที่ร้องขอ กรุณาส่งเลขบัตรประชาชนเพื่อยันยันตัวตน";
            Response.Write(result);
            fnSaveLogUser(pid + " [" + sn + "]", "API ค้นหาภาพสมุดนำจด", "ShowImage", result, false);
            return;
        }
      
        try
        {

            //Response.Write("GRI:" + GunRegID);
            GRB_WebService.GRB_WebService GRB_ws = new GRB_WebService.GRB_WebService();
            DataTable dt = GRB_ws.API_getRecord(GunRegID);
            if (dt == null || dt.Rows.Count == 0)
            {
                Response.Write("ไม่พบข้อมูลหมายเลขทะเบียนนี้");
                fnSaveLogUser(pid+" ["+sn+"]", "API ค้นหาภาพสมุดนำจด", "ShowImage", "["+ GunRegID+"] ไม่พบข้อมูลหมายเลขทะเบียนนี้", false);
            }
            else
            {

                int BookNo = int.Parse("" + dt.Rows[0]["BookNo"]);
                int PageNo = int.Parse("" + dt.Rows[0]["PageNo"]);
                int VerNo = int.Parse("" + dt.Rows[0]["PageVersion"]);

                byte[] byteimg = GRB_ws.GetImagePage(BookNo, PageNo, VerNo);
                string imgdata = Convert.ToBase64String((byte[])byteimg);

                string Path = Server.MapPath(BookNo + "_" + PageNo + "_" + VerNo + ".png");

                System.IO.File.WriteAllBytes(Path, byteimg);

                Image1.ImageUrl = BookNo + "_" + PageNo + "_" + VerNo + ".png";

                fnSaveLogUser(pid+" ["+sn+"]", "API ค้นหาภาพสมุดนำจด", "ShowImage","ค้นหาภาพสมุดนำจด เล่มที่ " + BookNo + " หน้า " + PageNo + " ด้วยเลขทะเบียนอาวุธปืน " + GunRegID, true);

            }

            return;

        }
        catch (Exception ex)
        {
            Response.Write("{\"output\":\"ERROR\",\"MSG\":\"ไม่มีรูปภาพ\"}");
            return;
        }
    }
}