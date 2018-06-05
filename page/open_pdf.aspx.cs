using System;
using System.Collections.Generic;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class page_open_pdf : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHostName = System.Net.Dns.GetHostName();
        string pathEBook = System.Configuration.ConfigurationSettings.AppSettings["pathPDF"];
        //string url = HttpContext.Current.Request.Url.AbsoluteUri;

        String currurl = HttpContext.Current.Request.RawUrl;

        //string param1 = HttpUtility.ParseQueryString(currurl).Get("param1");

        String querystring = null;

        int iqs = currurl.IndexOf('?');
        if (iqs == -1)
        {
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "Confirm();", true);
            //String redirecturl = currurl + "?var1=1&var2=2+2%2f3&var1=3";
            //Response.Redirect(redirecturl, true);
            Label1.Text = "ไม่มีไฟล์ที่ต้องการเปิด";
        }
        else if (iqs >= 0)
        {
            querystring = (iqs < currurl.Length - 1) ? currurl.Substring(iqs + 1) : String.Empty;

            string BookNo = "0000" + HttpUtility.ParseQueryString(querystring).Get("BookNo");
            string BookYear = "Y" + HttpUtility.ParseQueryString(querystring).Get("BookYear");

            BookNo = "B" + BookNo.Substring(BookNo.Length - 4);

            //string FilePath = Server.MapPath("../PDF/B" + BookNo + ".pdf");
            WebClient User = new WebClient();
            Byte[] FileBuffer = User.DownloadData("//" + strHostName + pathEBook + "Active/" + BookYear + "/" + BookNo + ".pdf");

            if (FileBuffer != null)
            {
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-length", FileBuffer.Length.ToString());
                Response.BinaryWrite(FileBuffer);
            }

        }

        //string param1 = HttpUtility.ParseQueryString(querystring).Get("var2");


    }

    protected void bttnpdf_Click(object sender, EventArgs e)
    {

    }
}