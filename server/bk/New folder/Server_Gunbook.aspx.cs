using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Web.Services;
using System.Text;
using System.IO;
using System.Diagnostics;
using System.Drawing;
using System.Text.RegularExpressions;

public partial class server_Server_Gunbook : System.Web.UI.Page
{
    string Connection = "NextwaverDatabase";
    string OfficeSpaceId = "OF.0001";
    string DatabaseName = "GunBook";
    XmlDocument xDoc;
    string RootPath = "//Document/Data/Section[@ID='1']/Items[@Name='GunBook']";

    string RootPathPage = "//Document/Data/Section[@ID='1']/Items[@Name='Page']";

    string strHostName = System.Net.Dns.GetHostName();
    string pathEBook = System.Configuration.ConfigurationSettings.AppSettings["pathPDF"];
    string pathImg = System.Configuration.ConfigurationSettings.AppSettings["pathImg"];

    UserProfile up = new UserProfile();

    protected void Page_Load(object sender, EventArgs e)
    {
        up = UserProfile.getProfile();
        string Command = Request.Params["Command"];
        switch (Command)
        {
            case "SaveBook": fnSaveBook(); break;
            case "LoadDataBook": fnLoadDataBook(); break;
            case "LoadDataPage": fnLoadDataPage(); break;
            case "SavePage": fnSavePage(); break;
            case "LoadStandard": fnLoadStandardCode(); break;
            case "SaveStandard": fnSaveStandardCode(); break;
            case "SaveStandardP": fnSaveStandardCodeP(); break;
            case "LoadStandardCode": fnLoadStandardCode(); break;
            case "DeleteStandard": fnDeleteStandardCode(); break;
            case "GetLastBookID": fnLoadLastBookID(); break;
            case "GetImage": fnGetImage(); break;
            case "SearchDataGun": fnSearchDataGun(); break;
            case "LoadDataGun": fnLoadDataGun(); break;
            case "ExportCsv": ExportCsv(); break;
            case "SearchGunReg": fnLoadGunReg(); break;
            case "LoadBookPDF": fnLoadPDF(); break;
            case "DataEntryCur": fnLoadDataEntryCur(); break;
            case "LoadGunBook": fnLoadTblGunBook(); break;
            case "CheckBook": fnCheckBookNo(); break;
            case "loadTaskBook": fnLoadTaskBook(); break;
            case "SaveTaskGenBook": fnSaveTaskBook(); break;
            case "GenEBook": fnGenPDF(); break;
            case "CheckGenEBook": fnCheckGenBook(); break;
            case "getCountData": fnCountDataAll(); break;
            case "ReportImage": fnReportImage(); break;
            case "getRePortImgData": fnDataReportImage(); break;
            case "API_getRecord":  fnGunRegID();break;
            case "DeletePage": fnDeletePage(); break;
            case "GetImageHide": fnGetImageHide(); break;
                
        }
    }

    #region Show Image Hide

    public void fnGetImageHide()
    {
        

        System.Diagnostics.Process.GetCurrentProcess().PriorityClass = System.Diagnostics.ProcessPriorityClass.RealTime;

        try
        {
            int BookNo = int.Parse(Request.Params["bookno"]);
            int PageNo = int.Parse(Request.Params["pageno"]);
            int VerNo = int.Parse(Request.Params["pagever"]);
            int gunID = int.Parse(Request.Params["gunregId"]);

            string LineNo = "";
            GRB_WebService.GRB_WebService GRB_ws = new GRB_WebService.GRB_WebService();
            DataTable dt = GRB_ws.GetDetailPage(BookNo.ToString(),PageNo.ToString(),VerNo.ToString());
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (gunID.ToString() == dt.Rows[i]["GunRegID"].ToString())
                {
                    LineNo = (i + 1).ToString();
                }
            }

            byte[] byteimg = GRB_ws.getImgHide(BookNo, PageNo, VerNo, LineNo);

            string imgdata = Convert.ToBase64String((byte[])byteimg);

            string OUTPUT = "{\"output\":\"OK\"";
            OUTPUT += ",\"imgStr\":\"" + imgdata + "\"";
            OUTPUT += "}";

            Response.Write(OUTPUT);
            return;

        }
        catch (Exception ex)
        {
            Response.Write("{\"output\":\"ERROR\",\"MSG\":\"ไม่มีรูปภาพ\"}");
            return;
        }

    }
    #endregion

    private void fnDeletePage()
    {
        string ID_LIST = Request.Params["ID_LIST"];
        string[] SP = ID_LIST.Split(new char[] { ',' });
        int CountOK = 0;
        try
        {
            WorkSpace.Service WS = new WorkSpace.Service();
            for (int i = 0; i < SP.Length; i++)
            {
                ID = SP[i];

                String strDoc = WS.SelectLastDocument(Connection, OfficeSpaceId, DatabaseName, "Page", int.Parse(ID), up._UserName);
                xDoc = new XmlDocument();
                xDoc.LoadXml(strDoc);
                AddDataXmlNode(RootPathPage + "/Item[@Name='PageStatus']", "Delete");
                AddDataXmlNode(RootPathPage + "/Item[@Name='SummitDate']", convertDatetime(DateTime.Now));
                AddDataXmlNode(RootPathPage + "/Item[@Name='SummitBy']", up._UserName);


                NextwaverDB.NColumns NCS = new NextwaverDB.NColumns();
                NCS.Add(new NextwaverDB.NColumn("PAGESTATUS", "Delete"));
                NCS.Add(new NextwaverDB.NColumn("UPDATEDATE", DateTime.Now.ToString("dd/MM/yyyy")));
                NCS.Add(new NextwaverDB.NColumn("UPDATEBY", up._UserName));

                NextwaverDB.NWheres NWS = new NextwaverDB.NWheres();
                NWS.Add("ID", ID);
                strDoc = xDoc.OuterXml;
                string[] OP = WS.UpdateData(Connection, OfficeSpaceId, DatabaseName, "Page", NCS.ExportString(), NWS.ExportString(), strDoc, up._UserName);
                CountOK++;
            }

            Response.Write("{\"output\":\"OK\"}");
        }
        catch { Response.Write("{\"output\":\"ERROR\",\"MSG\":\"ลบข้อมูลสำเร็จทั้งหมด " + CountOK + " จาก " + SP.Length + " รายการ\"}"); }


        //Response.Write("{\"output\":\"OK\"}");
    }
    private void fnGunRegID()
    {
        string GunRegID = Request.Params["GunRegID"];

        try
        {
            GRB_WebService.GRB_WebService GRB_ws = new GRB_WebService.GRB_WebService();
            DataTable dt = GRB_ws.API_getRecord(GunRegID);
            if (dt == null || dt.Rows.Count == 0)
            {
                string OUTPUT = "{\"output\":\"ERROR\"";
                OUTPUT += ",\"message\":\"No GunReqID\"";
                OUTPUT += "}";

                Response.Write(OUTPUT);
            }
            else
            {
                // BookNo,PageNo,PageVersion
                string OUTPUT = "{\"output\":\"OK\"";
                OUTPUT += ",\"BookNo\":\"" + dt.Rows[0]["BookNo"] + "\"";
                OUTPUT += ",\"PageNo\":\"" + dt.Rows[0]["PageNo"] + "\"";
                OUTPUT += ",\"PageVersion\":\"" + dt.Rows[0]["PageVersion"] + "\"";
                OUTPUT += "}";

                Response.Write(OUTPUT);
            }
           

           
            return;

        }
        catch (Exception ex)
        {
            Response.Write("{\"output\":\"ERROR\",\"MSG\":\"ไม่มีรูปภาพ\"}");
            return;
        }

    }
    private void fnLoadLastBookID()
    {
        try
        {
            WorkSpace.Service WS = new WorkSpace.Service();
            int LastID = 0;
            NextwaverDB.NColumns NCS_TYPE = new NextwaverDB.NColumns();
            NCS_TYPE.Add(new NextwaverDB.NColumn("BOOKNO"));

            DataTable dtType = WS.SelectAllByColumn(Connection, OfficeSpaceId, DatabaseName, "Book", NCS_TYPE.ExportString(), up._UserName);

            if (dtType != null)
            {
                for (int i = 0; i < dtType.Rows.Count; i++)
                {
                    if (i == 0)
                        LastID = Convert.ToInt16(dtType.Rows[i][0].ToString());
                    else
                    {
                        if (LastID < Convert.ToInt16(dtType.Rows[i][0].ToString()))
                            LastID = Convert.ToInt16(dtType.Rows[i][0].ToString());
                    }
                }
            }
            // Use the Select method to find all rows matching the filter.
            LastID = LastID + 1;

            string OUTPUT = "{\"output\":\"OK\"";
            OUTPUT += ",\"LastID\":\"" + LastID.ToString() + "\"";
            OUTPUT += "}";
            Response.Write(OUTPUT);
        }
        catch (Exception ex)
        {
            Response.Write("{\"output\":\"ERROR\",\"MSG\":\"ไม่สามารถโหลดข้อมูลได้\"}");
        }
    }

    private void fnLoadDataBook()
    {
        string ID = Request.Params["ID"];

        try
        {
            string BOOKNO = "";
            string BOOKYEAR = "";
            string GUNREGIDSTART = "";
            string GUNREGIDEND = "";
            string PAGETOTAL = "";
            string GUNREGIDPREFIX = "";
            string GROUPGUN = "";

            if (ID != null && ID.Trim() != "")
            {
                WorkSpace.Service WS = new WorkSpace.Service();
                NextwaverDB.NWheres NWS = new NextwaverDB.NWheres();

                NWS = new NextwaverDB.NWheres();
                NWS.Add(new NextwaverDB.NWhere("ID", ID));
                DataTable dt = WS.SelectAllColumnByWhere(Connection, OfficeSpaceId, DatabaseName, "Book", NWS.ExportString(), "system");
                if (dt.Rows.Count > 0)
                {
                    BOOKNO = dt.Rows[0]["BOOKNO"].ToString();
                    BOOKYEAR = dt.Rows[0]["BOOKYEAR"].ToString();
                    GUNREGIDSTART = dt.Rows[0]["GUNREGIDSTART"].ToString();
                    GUNREGIDEND = dt.Rows[0]["GUNREGIDEND"].ToString();
                    PAGETOTAL = dt.Rows[0]["PAGETOTAL"].ToString();
                    GUNREGIDPREFIX = dt.Rows[0]["GUNREGIDPREFIX"].ToString();
                    GROUPGUN = dt.Rows[0]["GROUPGUN"].ToString();
                }

            }


            string OUTPUT = "{\"output\":\"OK\"";
            OUTPUT += ",\"BOOKNO\":\"" + BOOKNO + "\"";
            OUTPUT += ",\"BOOKYEAR\":\"" + BOOKYEAR + "\"";
            OUTPUT += ",\"GUNREGIDSTART\":\"" + GUNREGIDSTART + "\"";
            OUTPUT += ",\"GUNREGIDEND\":\"" + GUNREGIDEND + "\"";
            OUTPUT += ",\"PAGETOTAL\":\"" + PAGETOTAL + "\"";
            OUTPUT += ",\"GUNREGIDPREFIX\":\"" + GUNREGIDPREFIX + "\"";
            OUTPUT += ",\"GROUPGUN\":\"" + GROUPGUN + "\"";
            OUTPUT += "}";
            Response.Write(OUTPUT);
        }
        catch (Exception ex)
        {
            Response.Write("{\"output\":\"ERROR\",\"MSG\":\"ไม่สามารถโหลดข้อมูลได้\"}");
        }
    }

    private void fnSaveBook()
    {
        try
        {
            fnSaveLogUser("", "fnSaveBook", "สร้างเล่ม");
        }
        catch (Exception)
        {
        }
        System.Diagnostics.Process.GetCurrentProcess().PriorityClass = System.Diagnostics.ProcessPriorityClass.RealTime;

        string ID = Request.Params["ID"];
        string bookno = Request.Params["bookno"];
        string bookyear = Request.Params["bookyear"];
        string gunregidstart = Request.Params["gunregidstart"];
        string gunregidend = Request.Params["gunregidend"];
        string pagetotal = Request.Params["pagetotal"];
        string gunregidprefix = Request.Params["gunregidprefix"];
        string groupgun = Request.Params["groupgun"];

        string old_bookno = Request.Params["old_bookno"];
        string old_pagetotal = Request.Params["old_pagetotal"];

        string NCS_Encrypt;
        string NWS_Encrypt;
        NextwaverDB.NColumns NCS_S;
        DataTable dt;

        string Command = "New";
        if (ID != "") Command = "Edit";

        WorkSpace.Service WS = new WorkSpace.Service();

        xDoc = new XmlDocument();
        if (ID == null || ID.Trim() == "")
            xDoc.Load(Server.MapPath("tempdoc/Book.xml"));
        else
        {
            String strDoc = WS.SelectLastDocument(Connection, OfficeSpaceId, DatabaseName, "Book", int.Parse(ID), up._UserName);
            xDoc.LoadXml(strDoc);
        }

        NextwaverDB.NColumns NCS = new NextwaverDB.NColumns();
        NCS.Add(new NextwaverDB.NColumn("BOOKNO", bookno));
        NCS.Add(new NextwaverDB.NColumn("BOOKYEAR", bookyear));
        NCS.Add(new NextwaverDB.NColumn("GUNREGIDSTART", gunregidstart));
        NCS.Add(new NextwaverDB.NColumn("GUNREGIDEND", gunregidend));
        NCS.Add(new NextwaverDB.NColumn("PAGETOTAL", pagetotal));
        NCS.Add(new NextwaverDB.NColumn("GROUPGUN", groupgun));
        NCS.Add(new NextwaverDB.NColumn("GUNREGIDPREFIX", gunregidprefix));

        AddDataXmlNode(RootPath + "/Item[@Name='BookNo']", bookno);
        AddDataXmlNode(RootPath + "/Item[@Name='BookYear']", bookyear);
        AddDataXmlNode(RootPath + "/Item[@Name='GunRegIDStart']", gunregidstart);
        AddDataXmlNode(RootPath + "/Item[@Name='GunRegIDEnd']", gunregidend);
        AddDataXmlNode(RootPath + "/Item[@Name='PageTotal']", pagetotal);
        AddDataXmlNode(RootPath + "/Item[@Name='GunRegIDPrefix']", gunregidprefix);

        if (Command == "New")
        {
            NCS.Add(new NextwaverDB.NColumn("BOOKSTATUS", "Create"));
            NCS.Add(new NextwaverDB.NColumn("CREATEDATE", convertDatetime(DateTime.Now)));
            NCS.Add(new NextwaverDB.NColumn("CREATEBY", up._UserName));
            NCS.Add(new NextwaverDB.NColumn("UPDATEDATE", convertDatetime(DateTime.Now)));
            NCS.Add(new NextwaverDB.NColumn("UPDATEBY", up._UserName));

            AddDataXmlNode(RootPath + "/Item[@Name='BookStatus']", "Create");
            AddDataXmlNode(RootPath + "/Item[@Name='CreateDate']", convertDatetime(DateTime.Now));
            AddDataXmlNode(RootPath + "/Item[@Name='CreateBy']", up._UserName);
            AddDataXmlNode(RootPath + "/Item[@Name='UpdateDate']", convertDatetime(DateTime.Now));
            AddDataXmlNode(RootPath + "/Item[@Name='UpdateBy']", up._UserName);

            int intPage = Convert.ToInt16(pagetotal);

            string strDoc = xDoc.OuterXml;

            NextwaverDB.NWheres NWS = new NextwaverDB.NWheres();
            NWS.Add(new NextwaverDB.NWhere("BOOKNO", bookno));

            NCS_S = new NextwaverDB.NColumns();
            NCS_S.Add(new NextwaverDB.NColumn("BOOKNO"));

            NCS_Encrypt = new EncryptDecrypt.CryptorEngine().Encrypt(NCS_S.ExportString(), true);
            NWS_Encrypt = new EncryptDecrypt.CryptorEngine().Encrypt(NWS.ExportString(), true);

            dt = WS.SelectByColumnAndWhere(Connection, OfficeSpaceId, DatabaseName, "Book", NCS_Encrypt, NWS_Encrypt, up._UserName);
            if (dt.Rows.Count > 0)
            {
                Response.Write("{\"output\":\"ERROR\",\"MSG\":\"มีรายการหนังสือเล่มนี้แล้ว\"}");
                return;
            }
            else
            {
                string[] OP = WS.InsertData(Connection, OfficeSpaceId, DatabaseName, "Book", NCS.ExportString(), strDoc, up._UserName);

                for (int i = 1; i <= intPage; i++)
                {
                    NextwaverDB.NColumns NCSPage = new NextwaverDB.NColumns();
                    NCSPage.Add(new NextwaverDB.NColumn("BOOKNO", bookno));
                    NCSPage.Add(new NextwaverDB.NColumn("PAGENO", i.ToString()));
                    NCSPage.Add(new NextwaverDB.NColumn("PAGEVERSION", "1"));
                    NCSPage.Add(new NextwaverDB.NColumn("PAGESTATUS", "Create"));
                    NCSPage.Add(new NextwaverDB.NColumn("CREATEDATE", convertDatetime(DateTime.Now)));
                    NCSPage.Add(new NextwaverDB.NColumn("CREATEBY", up._UserName));
                    NCSPage.Add(new NextwaverDB.NColumn("UPDATEDATE", convertDatetime(DateTime.Now)));
                    NCSPage.Add(new NextwaverDB.NColumn("UPDATEBY", up._UserName));

                    XmlDocument xDocPage = new XmlDocument();
                    xDocPage.Load(Server.MapPath("tempdoc/Page.xml"));

                    AddDataXmlNode(xDocPage, RootPathPage + "/Item[@Name='BookNo']", bookno);
                    AddDataXmlNode(xDocPage, RootPathPage + "/Item[@Name='PageNo']", i.ToString());
                    AddDataXmlNode(xDocPage, RootPathPage + "/Item[@Name='PageVersion']", "1");
                    AddDataXmlNode(xDocPage, RootPathPage + "/Item[@Name='PageStatus']", "Create");
                    AddDataXmlNode(xDocPage, RootPathPage + "/Item[@Name='CreateDate']", convertDatetime(DateTime.Now));
                    AddDataXmlNode(xDocPage, RootPathPage + "/Item[@Name='CreateBy']", up._UserName);
                    AddDataXmlNode(xDocPage, RootPathPage + "/Item[@Name='UpdateDate']", convertDatetime(DateTime.Now));
                    AddDataXmlNode(xDocPage, RootPathPage + "/Item[@Name='UpdateBy']", up._UserName);

                    //string XPathDataRecord = "//Document/Data/Section[@ID='2']/Items[@Name='RecordInfo']";
                    //Xml_add_item(xDocPage, XPathDataRecord, 40);

                    string strDocPage = xDocPage.OuterXml;
                    string[] OPPage = WS.InsertData(Connection, OfficeSpaceId, DatabaseName, "Page", NCSPage.ExportString(), strDocPage, up._UserName);
                }
                if (OP[0].ToUpper() == "OK")
                {
                    Response.Write("{\"output\":\"OK\"}");
                    return;
                }
                else
                {
                    Response.Write("{\"output\":\"ERROR\",\"MSG\":\"" + OP[1] + "\"}");
                    return;
                }
            }
        }
        else
        {
            NextwaverDB.NWheres NWS;
            if (old_bookno != bookno)
            {
                NWS = new NextwaverDB.NWheres();
                NWS.Add(new NextwaverDB.NWhere("BOOKNO", bookno));

                NCS_S = new NextwaverDB.NColumns();
                NCS_S.Add(new NextwaverDB.NColumn("BOOKNO"));
                NCS_S.Add(new NextwaverDB.NColumn("PAGETOTAL"));

                NCS_Encrypt = new EncryptDecrypt.CryptorEngine().Encrypt(NCS_S.ExportString(), true);
                NWS_Encrypt = new EncryptDecrypt.CryptorEngine().Encrypt(NWS.ExportString(), true);

                dt = WS.SelectByColumnAndWhere(Connection, OfficeSpaceId, DatabaseName, "Book", NCS_Encrypt, NWS_Encrypt, up._UserName);

                if (dt.Rows.Count > 0)
                {
                    string tmpBOOKNO = "" + dt.Rows[0]["BOOKNO"];
                    if (tmpBOOKNO != old_bookno)
                    {
                        Response.Write("{\"output\":\"ERROR\",\"MSG\":\"มีรายการหนังสือเล่มนี้แล้ว\"}");
                        return;
                    }
                }
            }

            NWS = new NextwaverDB.NWheres();
            NWS.Add(new NextwaverDB.NWhere("BOOKNO", bookno));
            NWS.Add(new NextwaverDB.NWhere("PAGEVERSION", "1"));

            NCS_S = new NextwaverDB.NColumns();
            NCS_S.Add(new NextwaverDB.NColumn("BOOKNO"));
            NCS_S.Add(new NextwaverDB.NColumn("PAGENO"));

            NCS_Encrypt = new EncryptDecrypt.CryptorEngine().Encrypt(NCS_S.ExportString(), true);
            NWS_Encrypt = new EncryptDecrypt.CryptorEngine().Encrypt(NWS.ExportString(), true);

            dt = WS.SelectByColumnAndWhere(Connection, OfficeSpaceId, DatabaseName, "Page", NCS_Encrypt, NWS_Encrypt, up._UserName);
            int MaxPageTotal = dt.Rows.Count;
            if (MaxPageTotal < int.Parse(pagetotal))
            {
                for (int i = (MaxPageTotal + 1); i <= int.Parse(pagetotal); i++)
                {
                    NextwaverDB.NColumns NCSPage = new NextwaverDB.NColumns();
                    NCSPage.Add(new NextwaverDB.NColumn("BOOKNO", bookno));
                    NCSPage.Add(new NextwaverDB.NColumn("PAGENO", i.ToString()));
                    NCSPage.Add(new NextwaverDB.NColumn("PAGEVERSION", "1"));
                    NCSPage.Add(new NextwaverDB.NColumn("PAGESTATUS", "Create"));
                    NCSPage.Add(new NextwaverDB.NColumn("CREATEDATE", convertDatetime(DateTime.Now)));
                    NCSPage.Add(new NextwaverDB.NColumn("CREATEBY", up._UserName));
                    NCSPage.Add(new NextwaverDB.NColumn("UPDATEDATE", convertDatetime(DateTime.Now)));
                    NCSPage.Add(new NextwaverDB.NColumn("UPDATEBY", up._UserName));

                    XmlDocument xDocPage = new XmlDocument();
                    xDocPage.Load(Server.MapPath("tempdoc/Page.xml"));

                    AddDataXmlNode(xDocPage, RootPathPage + "/Item[@Name='BookNo']", bookno);
                    AddDataXmlNode(xDocPage, RootPathPage + "/Item[@Name='PageNo']", i.ToString());
                    AddDataXmlNode(xDocPage, RootPathPage + "/Item[@Name='PageVersion']", "1");
                    AddDataXmlNode(xDocPage, RootPathPage + "/Item[@Name='PageStatus']", "Create");
                    AddDataXmlNode(xDocPage, RootPathPage + "/Item[@Name='CreateDate']", convertDatetime(DateTime.Now));
                    AddDataXmlNode(xDocPage, RootPathPage + "/Item[@Name='CreateBy']", up._UserName);
                    AddDataXmlNode(xDocPage, RootPathPage + "/Item[@Name='UpdateDate']", convertDatetime(DateTime.Now));
                    AddDataXmlNode(xDocPage, RootPathPage + "/Item[@Name='UpdateBy']", up._UserName);

                    string strDocPage = xDocPage.OuterXml;
                    string[] OPPage = WS.InsertData(Connection, OfficeSpaceId, DatabaseName, "Page", NCSPage.ExportString(), strDocPage, up._UserName);
                }
            }

            AddDataXmlNode(RootPath + "/Item[@Name='UpdateDate']", convertDatetime(DateTime.Now));
            AddDataXmlNode(RootPath + "/Item[@Name='UpdateBy']", up._UserName);

            NCS.Add(new NextwaverDB.NColumn("UPDATEDATE", convertDatetime(DateTime.Now)));
            NCS.Add(new NextwaverDB.NColumn("UPDATEBY", up._UserName));

            NWS = new NextwaverDB.NWheres();
            NWS.Add(new NextwaverDB.NWhere("ID", ID));

            string strDoc = xDoc.OuterXml;

            string[] OP = WS.UpdateData(Connection, OfficeSpaceId, DatabaseName, "Book", NCS.ExportString(), NWS.ExportString(), strDoc, up._UserName);

            if (OP[0].ToUpper() == "OK")
            {
                Response.Write("{\"output\":\"OK\"}");
                return;
            }
            else
            {
                Response.Write("{\"output\":\"ERROR\",\"MSG\":\"" + OP[1] + "\"}");
                return;
            }
        }
    }

    private void fnLoadDataPage()
    {
        string ID = Request.Params["ID"];
        WorkSpace.Service WS = new WorkSpace.Service();
        xDoc = new XmlDocument();
        try
        {
            if (ID == null || ID.Trim() == "")
                xDoc.Load(Server.MapPath("tempdoc/Page.xml"));
            else
            {
                String strDoc = WS.SelectLastDocument(Connection, OfficeSpaceId, DatabaseName, "Page", int.Parse(ID), up._UserName);
                xDoc.LoadXml(strDoc);
            }

            string BOOKNO = "" + GetDataXmlNode(RootPathPage + "/Item[@Name='BookNo']");
            string PAGENO = "" + GetDataXmlNode(RootPathPage + "/Item[@Name='PageNo']");
            string PAGEVER = "" + GetDataXmlNode(RootPathPage + "/Item[@Name='PageVersion']");
            string IMGURL = "" + GetDataXmlNode(RootPathPage + "/Item[@Name='ImgUrl']");
            string STATUS = "" + GetDataXmlNode(RootPathPage + "/Item[@Name='PageStatus']");

            string XPathDataRecord = "//Document/Data/Section[@ID='2']/Items[@Name='RecordInfo']";

            string str = Xml_To_Json(xDoc.SelectSingleNode(XPathDataRecord));

            str = "[" + str + "]";

            string[] arrayStandard = { "GunType", "GunSize", "GunBrand", "GunBarrel", "GunColor", "GunOwner", "GunCountry" };

            string standardJson = "";

            foreach (string datatype in arrayStandard)
            {
                NextwaverDB.NWheres NWS = new NextwaverDB.NWheres();
                NWS.Add(new NextwaverDB.NWhere("DELETE", "0"));

                NextwaverDB.NColumns NCS_S = new NextwaverDB.NColumns();
                NCS_S.Add(new NextwaverDB.NColumn("NAME"));

                string NCS_Encrypt = new EncryptDecrypt.CryptorEngine().Encrypt(NCS_S.ExportString(), true);
                string NWS_Encrypt = new EncryptDecrypt.CryptorEngine().Encrypt(NWS.ExportString(), true);

                DataTable dtType = WS.SelectByColumnAndWhere(Connection, OfficeSpaceId, DatabaseName, datatype, NCS_Encrypt, NWS_Encrypt, up._UserName);

                string jsonTYPE = "";
                if (dtType != null)
                {
                    for (int i = 0; i < dtType.Rows.Count; i++)
                    {
                        if (i == 0)
                            jsonTYPE = "\"" + dtType.Rows[i][0] + "\"";
                        else
                            jsonTYPE += ",\"" + dtType.Rows[i][0] + "\"";
                    }
                }

                jsonTYPE = "[" + jsonTYPE + "]";

                standardJson += ",\"standard" + datatype + "\":" + jsonTYPE + "";
            }

            string OUTPUT = "{\"output\":\"OK\"";
            OUTPUT += ",\"BOOKNO\":\"" + BOOKNO + "\"";
            OUTPUT += ",\"PAGENO\":\"" + PAGENO + "\"";
            OUTPUT += ",\"PAGEVER\":\"" + PAGEVER + "\"";
            OUTPUT += ",\"IMGURL\":\"" + IMGURL + "\"";
            OUTPUT += ",\"STATUS\":\"" + STATUS + "\"";
            OUTPUT += ",\"USER\":\"" + up._UserName + "\"";
            OUTPUT += ",\"DATARECORDS\":" + str + "";
            OUTPUT += standardJson;
            OUTPUT += "}";
            Response.Write(OUTPUT);
        }
        catch (Exception ex)
        {
            Response.Write("{\"output\":\"ERROR\",\"MSG\":\"ไม่สามารถโหลดข้อมูลได้\"}");
        }

    }

    private void fnSavePage()
    {
        try
        {
            fnSaveLogUser("", "fnSavePage", "บันทึกข้อมูลหน้า");
        }
        catch (Exception)
        {
        }
        string ID = Request.Params["ID"];
        string bookno = Request.Params["bookno"];
        string pageno = Request.Params["pageno"];

        string record = Request.Params["record"];
        string savetype = Request.Params["savetype"];

        record = record.Replace("null", "");

        string Command = "New";
        if (ID != "") Command = "Edit";

        System.Diagnostics.Process.GetCurrentProcess().PriorityClass = System.Diagnostics.ProcessPriorityClass.RealTime;

        WorkSpace.Service WS = new WorkSpace.Service();

        xDoc = new XmlDocument();
        if (ID == null || ID.Trim() == "")
            xDoc.Load(Server.MapPath("tempdoc/Page.xml"));
        else
        {
            String strDoc = WS.SelectLastDocument(Connection, OfficeSpaceId, DatabaseName, "Page", int.Parse(ID), up._UserName);
            xDoc.LoadXml(strDoc);
        }
        string XPathDataRecord = "//Document/Data/Section[@ID='2']/Items[@Name='RecordInfo']";

        //saveDocStandardCode(record);

        addJson_To_Xml(xDoc, record, XPathDataRecord);

        NextwaverDB.NColumns NCS = new NextwaverDB.NColumns();
        NCS.Add(new NextwaverDB.NColumn("BOOKNO", bookno));
        NCS.Add(new NextwaverDB.NColumn("PAGENO", pageno));

        AddDataXmlNode(RootPathPage + "/Item[@Name='BookNo']", bookno);
        AddDataXmlNode(RootPathPage + "/Item[@Name='PageNo']", pageno);

        if (Command == "New")
        {
            NCS.Add(new NextwaverDB.NColumn("CREATEDATE", convertDatetime(DateTime.Now)));
            NCS.Add(new NextwaverDB.NColumn("CREATEBY", up._UserName));
            NCS.Add(new NextwaverDB.NColumn("UPDATEDATE", convertDatetime(DateTime.Now)));
            NCS.Add(new NextwaverDB.NColumn("UPDATEBY", up._UserName));

            AddDataXmlNode(RootPath + "/Item[@Name='CreateDate']", convertDatetime(DateTime.Now));
            AddDataXmlNode(RootPath + "/Item[@Name='CreateBy']", up._UserName);
            AddDataXmlNode(RootPath + "/Item[@Name='UpdateDate']", convertDatetime(DateTime.Now));
            AddDataXmlNode(RootPath + "/Item[@Name='UpdateBy']", up._UserName);

            string strDoc = xDoc.OuterXml;
            string[] OP = WS.InsertData(Connection, OfficeSpaceId, DatabaseName, "Page", NCS.ExportString(), strDoc, up._UserName);

            if (OP[0].ToUpper() == "OK")
            {
                Response.Write("{\"output\":\"OK\"}");
                return;
            }
            else
            {
                Response.Write("{\"output\":\"ERROR\",\"MSG\":\"" + OP[1] + "\"}");
                return;
            }
        }
        else
        {
            if (savetype == "1")
            {
                AddDataXmlNode(RootPathPage + "/Item[@Name='PageStatus']", "Save");
                AddDataXmlNode(RootPathPage + "/Item[@Name='DataEntryDate']", convertDatetime(DateTime.Now));
                AddDataXmlNode(RootPathPage + "/Item[@Name='DataEntryBy']", up._UserName);

                NCS.Add(new NextwaverDB.NColumn("PAGESTATUS", "Save"));
                NCS.Add(new NextwaverDB.NColumn("DATAENTRYDATE", convertDatetime(DateTime.Now)));
                NCS.Add(new NextwaverDB.NColumn("DATAENTRYBY", up._UserName));
            }
            else if (savetype == "2")
            {
                AddDataXmlNode(RootPathPage + "/Item[@Name='PageStatus']", "Submit");
                AddDataXmlNode(RootPathPage + "/Item[@Name='SummitDate']", convertDatetime(DateTime.Now));
                AddDataXmlNode(RootPathPage + "/Item[@Name='SummitBy']", up._UserName);

                NCS.Add(new NextwaverDB.NColumn("PAGESTATUS", "Submit"));
                NCS.Add(new NextwaverDB.NColumn("SUBMITDATE", convertDatetime(DateTime.Now)));
                NCS.Add(new NextwaverDB.NColumn("SUBMITBY", up._UserName));
            }
            else if (savetype == "3")
            {
                AddDataXmlNode(RootPathPage + "/Item[@Name='PageStatus']", "Approve");
                AddDataXmlNode(RootPathPage + "/Item[@Name='ApproveDate']", convertDatetime(DateTime.Now));
                AddDataXmlNode(RootPathPage + "/Item[@Name='ApproveBy']", up._UserName);

                NCS.Add(new NextwaverDB.NColumn("PAGESTATUS", "Approve"));
                NCS.Add(new NextwaverDB.NColumn("APPROVEDATE", convertDatetime(DateTime.Now)));
                NCS.Add(new NextwaverDB.NColumn("APPROVEBY", up._UserName));
            }

            AddDataXmlNode(RootPathPage + "/Item[@Name='UpdateDate']", convertDatetime(DateTime.Now));
            AddDataXmlNode(RootPathPage + "/Item[@Name='UpdateBy']", up._UserName);

            NCS.Add(new NextwaverDB.NColumn("UPDATEDATE", convertDatetime(DateTime.Now)));
            NCS.Add(new NextwaverDB.NColumn("UPDATEBY", up._UserName));

            NextwaverDB.NWheres NWS = new NextwaverDB.NWheres();
            NWS.Add(new NextwaverDB.NWhere("ID", ID));

            string strDoc = xDoc.OuterXml;

            string[] OP = WS.UpdateData(Connection, OfficeSpaceId, DatabaseName, "Page", NCS.ExportString(), NWS.ExportString(), strDoc, up._UserName);

            if (OP[0].ToUpper() == "OK")
            {
                Response.Write("{\"output\":\"OK\"}");
                return;
            }
            else
            {
                Response.Write("{\"output\":\"ERROR\",\"MSG\":\"" + OP[1] + "\"}");
                return;
            }
        }
    }

    public void fnSaveStandardCode()
    {
        string ID = Request.Params["ID"];
        string strCol = Request.Params["datatype"];
        string strName = Request.Params["name"];
        string strDesc = Request.Params["desc"];

        WorkSpace.Service WS = new WorkSpace.Service();

        string Command = "New";
        if (ID != "") Command = "Edit";

        NextwaverDB.NWheres NWS = new NextwaverDB.NWheres();
        NWS.Add(new NextwaverDB.NWhere("NAME", strName));
        NWS.Add(new NextwaverDB.NWhere("DELETE", "0"));

        NextwaverDB.NColumns NCS_S = new NextwaverDB.NColumns();
        NCS_S.Add(new NextwaverDB.NColumn("NAME"));

        string NCS_Encrypt = new EncryptDecrypt.CryptorEngine().Encrypt(NCS_S.ExportString(), true);
        string NWS_Encrypt = new EncryptDecrypt.CryptorEngine().Encrypt(NWS.ExportString(), true);

        DataTable dt = WS.SelectByColumnAndWhere(Connection, OfficeSpaceId, DatabaseName, strCol, NCS_Encrypt, NWS_Encrypt, up._UserName);

        NextwaverDB.NColumns NCS = new NextwaverDB.NColumns();
        NCS.Add(new NextwaverDB.NColumn("NAME", strName));
        NCS.Add(new NextwaverDB.NColumn("DESCRIPTION", strDesc));
        NCS.Add(new NextwaverDB.NColumn("UPDATEDATE", convertDatetime(DateTime.Now)));
        NCS.Add(new NextwaverDB.NColumn("DELETE", "0"));

        if (Command == "New" && dt.Rows.Count == 0)
        {
            string[] OP = WS.InsertData(Connection, OfficeSpaceId, DatabaseName, strCol, NCS.ExportString(), "", up._UserName);

            if (OP[0].ToUpper() == "OK")
            {
                Response.Write("{\"output\":\"OK\"}");
                return;
            }
            else
            {
                Response.Write("{\"output\":\"ERROR\",\"MSG\":\"" + OP[1] + "\"}");
                return;
            }
        }
        else if (Command == "Edit")
        {
            NextwaverDB.NWheres NWS_S = new NextwaverDB.NWheres();
            NWS_S.Add(new NextwaverDB.NWhere("ID", ID));

            string[] OP = WS.UpdateData(Connection, OfficeSpaceId, DatabaseName, strCol, NCS.ExportString(), NWS_S.ExportString(), "", up._UserName);

            if (OP[0].ToUpper() == "OK")
            {
                Response.Write("{\"output\":\"OK\"}");
                return;
            }
            else
            {
                Response.Write("{\"output\":\"ERROR\",\"MSG\":\"" + OP[1] + "\"}");
                return;
            }
        }
        else
        {
            Response.Write("{\"output\":\"ERROR\",\"MSG\":\"มีรายการนี้แล้ว\"}");
            return;
        }


    }

    private void fnLoadStandardCode()
    {
        string ID = Request.Params["ID"];
        string strCol = Request.Params["datatype"];

        string strName = "";
        string strDesc = "";
        try
        {
            WorkSpace.Service WS = new WorkSpace.Service();
            if (ID != null && ID.Trim() != "")
            {
                NextwaverDB.NWheres NWS = new NextwaverDB.NWheres();
                NWS.Add(new NextwaverDB.NWhere("ID", ID));

                NextwaverDB.NColumns NCS_S = new NextwaverDB.NColumns();
                NCS_S.Add(new NextwaverDB.NColumn("NAME"));
                NCS_S.Add(new NextwaverDB.NColumn("DESCRIPTION"));

                string NCS_Encrypt = new EncryptDecrypt.CryptorEngine().Encrypt(NCS_S.ExportString(), true);
                string NWS_Encrypt = new EncryptDecrypt.CryptorEngine().Encrypt(NWS.ExportString(), true);

                DataTable dt = WS.SelectByColumnAndWhere(Connection, OfficeSpaceId, DatabaseName, strCol, NCS_Encrypt, NWS_Encrypt, up._UserName);
                if (dt.Rows.Count > 0)
                {
                    strName = dt.Rows[0]["NAME"].ToString();
                    strDesc = dt.Rows[0]["DESCRIPTION"].ToString();
                }
            }
            string Command = Request.Params["Command"];

            if (Command == "LoadStandardCode")
            {
                NextwaverDB.NWheres NWS_T = new NextwaverDB.NWheres();
                NWS_T.Add(new NextwaverDB.NWhere("DELETE", "0"));
                DataTable dtData = WS.SelectAllColumnByWhere(Connection, OfficeSpaceId, DatabaseName, strCol, NWS_T.ExportString(), up._UserName);

                string dataJson = Data_To_JSON(dtData);
                dataJson = "[" + dataJson + "]";

                string OUTPUT = "{\"output\":\"OK\"";
                OUTPUT += ",\"Records\":" + dataJson + "";
                OUTPUT += "}";
                Response.Write(OUTPUT);
            }
            else
            {
                string OUTPUT = "{\"output\":\"OK\"";
                OUTPUT += ",\"NAME\":\"" + strName + "\"";
                OUTPUT += ",\"DESC\":\"" + strDesc + "\"";
                OUTPUT += "}";
                Response.Write(OUTPUT);
            }

        }
        catch (Exception ex)
        {
            Response.Write("{\"output\":\"ERROR\",\"MSG\":\"ไม่สามารถโหลดข้อมูลได้\"}");
        }
    }

    public void fnDeleteStandardCode()
    {
        string strCol = Request.Params["datatype"];
        string strID = Request.Params["ID"];

        WorkSpace.Service WS = new WorkSpace.Service();

        NextwaverDB.NColumns NCS = new NextwaverDB.NColumns();
        NCS.Add(new NextwaverDB.NColumn("UPDATEDATE", convertDatetime(DateTime.Now)));
        NCS.Add(new NextwaverDB.NColumn("DELETE", "1"));

        NextwaverDB.NWheres NWS_S = new NextwaverDB.NWheres();
        NWS_S.Add(new NextwaverDB.NWhere("ID", strID));

        string[] OP = WS.UpdateData(Connection, OfficeSpaceId, DatabaseName, strCol, NCS.ExportString(), NWS_S.ExportString(), "", up._UserName);

        if (OP[0].ToUpper() == "OK")
        {
            Response.Write("{\"output\":\"OK\"}");
            return;
        }
        else
        {
            Response.Write("{\"output\":\"ERROR\",\"MSG\":\"" + OP[1] + "\"}");
            return;
        }

    }

    public void fnSaveStandardCodeP()
    {
        string strCol = Request.Params["datatype"];
        string strName = Request.Params["name"];
        string strDesc = Request.Params["desc"];

        WorkSpace.Service WS = new WorkSpace.Service();

        NextwaverDB.NWheres NWS = new NextwaverDB.NWheres();
        NWS.Add(new NextwaverDB.NWhere("NAME", strName));

        NextwaverDB.NColumns NCS_S = new NextwaverDB.NColumns();
        NCS_S.Add(new NextwaverDB.NColumn("NAME"));

        string NCS_Encrypt = new EncryptDecrypt.CryptorEngine().Encrypt(NCS_S.ExportString(), true);
        string NWS_Encrypt = new EncryptDecrypt.CryptorEngine().Encrypt(NWS.ExportString(), true);

        DataTable dt = WS.SelectByColumnAndWhere(Connection, OfficeSpaceId, DatabaseName, strCol, NCS_Encrypt, NWS_Encrypt, up._UserName);

        NextwaverDB.NColumns NCS = new NextwaverDB.NColumns();
        NCS.Add(new NextwaverDB.NColumn("NAME", strName));
        NCS.Add(new NextwaverDB.NColumn("DESCRIPTION", strDesc));
        NCS.Add(new NextwaverDB.NColumn("UPDATEDATE", convertDatetime(DateTime.Now)));
        NCS.Add(new NextwaverDB.NColumn("DELETE", "0"));

        if (dt.Rows.Count == 0)
        {
            string[] OP = WS.InsertData(Connection, OfficeSpaceId, DatabaseName, strCol, NCS.ExportString(), "", up._UserName);

            if (OP[0].ToUpper() == "OK")
            {
                NextwaverDB.NWheres NWS_s = new NextwaverDB.NWheres();
                NWS_s.Add(new NextwaverDB.NWhere("DELETE", "0"));

                NextwaverDB.NColumns NCS_Ss = new NextwaverDB.NColumns();
                NCS_Ss.Add(new NextwaverDB.NColumn("NAME"));

                string NCS_Encrypta = new EncryptDecrypt.CryptorEngine().Encrypt(NCS_Ss.ExportString(), true);
                string NWS_Encrypta = new EncryptDecrypt.CryptorEngine().Encrypt(NWS_s.ExportString(), true);

                DataTable dtType = WS.SelectByColumnAndWhere(Connection, OfficeSpaceId, DatabaseName, strCol, NCS_Encrypta, NWS_Encrypta, up._UserName);

                string jsonTYPE = "";
                if (dtType != null)
                {
                    for (int i = 0; i < dtType.Rows.Count; i++)
                    {
                        if (i == 0)
                            jsonTYPE = "\"" + dtType.Rows[i][0] + "\"";
                        else
                            jsonTYPE += ",\"" + dtType.Rows[i][0] + "\"";
                    }
                }

                jsonTYPE = "[" + jsonTYPE + "]";

                string OUTPUT = "{\"output\":\"OK\"";
                OUTPUT += ",\"DATARECORDS\":" + jsonTYPE + "";
                OUTPUT += "}";

                Response.Write(OUTPUT);
                return;
            }
            else
            {
                Response.Write("{\"output\":\"ERROR\",\"MSG\":\"" + OP[1] + "\"}");
                return;
            }
        }
        else
        {
            Response.Write("{\"output\":\"ERROR\",\"MSG\":\"มีรายการนี้แล้ว\"}");
            return;
        }

    }

    public void fnGetImage()
    {
        System.Diagnostics.Process.GetCurrentProcess().PriorityClass = System.Diagnostics.ProcessPriorityClass.RealTime;

        try
        {
            int BookNo = int.Parse(Request.Params["bookno"]);
            int PageNo = int.Parse(Request.Params["pageno"]);
            int VerNo = int.Parse(Request.Params["pagever"]);

            GRB_WebService.GRB_WebService GRB_ws = new GRB_WebService.GRB_WebService();
            byte[] byteimg = GRB_ws.GetImagePage(BookNo, PageNo, VerNo);

            string imgdata = Convert.ToBase64String((byte[])byteimg);

            string OUTPUT = "{\"output\":\"OK\"";
            OUTPUT += ",\"imgStr\":\"" + imgdata + "\"";
            OUTPUT += "}";

            Response.Write(OUTPUT);
            return;

        }
        catch (Exception ex)
        {
            Response.Write("{\"output\":\"ERROR\",\"MSG\":\"ไม่มีรูปภาพ\"}");
            return;
        }

    }

    public void fnReportImage()
    {
        try
        {
            fnSaveLogUser("", "fnReportImage", "รายงานภาพเสีย");
        }
        catch (Exception)
        {
        }
        System.Diagnostics.Process.GetCurrentProcess().PriorityClass = System.Diagnostics.ProcessPriorityClass.RealTime;

        try
        {
            int BookNo = int.Parse(Request.Params["bookno"]);
            int PageNo = int.Parse(Request.Params["pageno"]);

            GRB_WebService.GRB_WebService GRB_ws = new GRB_WebService.GRB_WebService();
            bool byteimg = GRB_ws.insertImg(BookNo, PageNo, "");

            string OUTPUT = "{\"output\":\"OK\"";
            OUTPUT += "}";

            Response.Write(OUTPUT);
            return;

        }
        catch (Exception ex)
        {
            Response.Write("{\"output\":\"ERROR\",\"MSG\":\"Success\"}");
            return;
        }

    }

    private void AddDataXmlNode(string xPath, string sValue)
    {
        XmlNode nodeControl = xDoc.SelectSingleNode(xPath);
        nodeControl.Attributes["Value"].Value = sValue;
    }
    private void AddDataXmlNode(XmlDocument xmlDoc, string xPath, string sValue)
    {
        XmlNode nodeControl = xmlDoc.SelectSingleNode(xPath);
        nodeControl.Attributes["Value"].Value = sValue;
    }
    private string GetDataXmlNode(string xPath)
    {
        XmlNode nodeControl = xDoc.SelectSingleNode(xPath);
        return "" + nodeControl.Attributes["Value"].Value;
    }
    private string GetDataXmlNode(XmlDocument xmlDoc, string xPath)
    {
        XmlNode nodeControl = xmlDoc.SelectSingleNode(xPath);
        return "" + nodeControl.Attributes["Value"].Value;
    }

    public string Xml_To_Json(XmlNode nodeDataGrid)
    {
        try
        {
            XmlNodeList nodeMeans = nodeDataGrid.SelectNodes("./Means/Mean");
            string Name;

            string[] colName = new string[nodeMeans.Count];

            for (int i = 0; i < nodeMeans.Count; i++)
            {
                Name = "" + nodeMeans[i].Attributes["Name"].Value;
                colName[i] = Name;
            }

            XmlNodeList listItem = nodeDataGrid.SelectNodes("./Item");
            StringBuilder json = new StringBuilder();

            for (int i = 0; i < listItem.Count; i++)
            {
                if (i == 0)
                    json.AppendFormat("{{");
                else
                    json.AppendFormat(", {{");

                for (int j = 0; j < colName.Length; j++)
                {
                    if (j == 0)
                        json.AppendFormat("\"{0}\": \"{1}\"", colName[j].ToString(), "" + listItem[i].Attributes[j].Value);
                    else
                        json.AppendFormat(", \"{0}\": \"{1}\"", colName[j].ToString(), "" + listItem[i].Attributes[j].Value);
                }
                json.AppendFormat("}}");
            }
            return json.ToString();
        }
        catch { return ""; }
    }

    public DataTable CreateDataSource(XmlNode nodeDataGrid)
    {
        try
        {
            XmlNodeList nodeMeans = nodeDataGrid.SelectNodes("./Means/Mean");
            string ID, Name, Type;

            DataTable dt = new DataTable();

            for (int i = 0; i < nodeMeans.Count; i++)
            {
                ID = "" + nodeMeans[i].Attributes["ID"].Value;
                Name = "" + nodeMeans[i].Attributes["Name"].Value;
                Type = "" + nodeMeans[i].Attributes["Type"].Value;

                switch (Type.ToUpper())
                {
                    case "INT": dt.Columns.Add(ID, typeof(int)); break;
                    case "DOUBLE": dt.Columns.Add(ID, typeof(Double)); break;
                    case "DATE": dt.Columns.Add(ID, typeof(DateTime)); break;
                    default: dt.Columns.Add(Name); break;
                }

            }

            XmlNodeList listItem = nodeDataGrid.SelectNodes("./Item");
            string sValue = "";
            for (int i = 0; i < listItem.Count; i++)
            {
                DataRow dr = dt.NewRow();
                dr.BeginEdit();
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    sValue = "" + listItem[i].Attributes[j].Value;
                    try { dr[j] = listItem[i].Attributes[j].Value; }
                    catch { }
                }
                dr.EndEdit();
                dt.Rows.Add(dr);
            }

            return dt;
        }
        catch { return null; }
    }

    public string Data_To_JSON(DataTable dt_temp)
    {
        StringBuilder json = new StringBuilder();

        for (int j = 0; j < dt_temp.Rows.Count; j++)
        {
            DataRow dr = dt_temp.Rows[j];

            if (j == 0)
                json.AppendFormat("{{");
            else
                json.AppendFormat(", {{");

            for (int i = 0; i < dt_temp.Columns.Count; i++)
            {
                if (i == 0)
                    json.AppendFormat("\"{0}\": \"{1}\"", dt_temp.Columns[i].ColumnName.ToString(), dr[i].ToString());
                else
                    json.AppendFormat(", \"{0}\": \"{1}\"", dt_temp.Columns[i].ColumnName.ToString(), dr[i].ToString());
            }
            json.AppendFormat("}}");
        }

        return json.ToString();
    }

    public void addJson_To_Xml(XmlDocument xmlDoc, string strJson, string nodeXml)
    {
        strJson = strJson.Replace("[{\"", "").Replace("\"}]", "");

        //strJson = strJson.Replace("\",\"", ",").Replace("\":\"", ":");
        //strJson = strJson.Replace("\":", ":").Replace(",\"", ",");

        string[] stringSeparators = new string[] { "\"},{\"", "\"}, {\"", "\"} , {\"", "\"} ,{\"" };
        string[] jsonrows = strJson.Split(stringSeparators, StringSplitOptions.None);

        string[] stringRows = new string[] { "\",\"", ",\"" };
        string[] stringData = new string[] { "\":\"", "\":" };

        XmlNode nodeDataGrid = xDoc.SelectSingleNode(nodeXml);
        XmlNodeList listItem = nodeDataGrid.SelectNodes("./Item");
        for (int i = 0; i < listItem.Count; i++)
        {
            nodeDataGrid.RemoveChild(listItem[i]);
        }
        XmlAttribute att;
        XmlNode nodeItem;
        //string[] jsonrows = strJson.Split(',');

        foreach (string strrow in jsonrows)
        {
            Dictionary<string, string> dictionary = new Dictionary<string, string>();
            //string strrows = strrow.Replace("\",\"", ",").Replace("\":\"", ":");
            //strrows = strrows.Replace("\":", ":");

            string[] rows = strrow.Split(stringRows, StringSplitOptions.None);
            foreach (string row in rows)
            {
                string strCol = row.Split(stringData, StringSplitOptions.None)[0];
                string strValue = row.Split(stringData, StringSplitOptions.None)[1];
                dictionary.Add(strCol, strValue);
            }
            nodeItem = xmlDoc.CreateElement("Item");

            att = xmlDoc.CreateAttribute("C00");
            att.Value = dictionary["GunRegID"].ToString();
            nodeItem.Attributes.Append(att);

            att = xmlDoc.CreateAttribute("C01");
            att.Value = dictionary["GunNo"].ToString();
            nodeItem.Attributes.Append(att);

            att = xmlDoc.CreateAttribute("C02");
            att.Value = dictionary["GunGroup"].ToString();
            nodeItem.Attributes.Append(att);

            att = xmlDoc.CreateAttribute("C03");
            att.Value = dictionary["GunType"].ToString();
            nodeItem.Attributes.Append(att);

            att = xmlDoc.CreateAttribute("C04");
            att.Value = dictionary["GunSize"].ToString();
            nodeItem.Attributes.Append(att);

            att = xmlDoc.CreateAttribute("C05");
            att.Value = dictionary["GunBrand"].ToString();
            nodeItem.Attributes.Append(att);

            att = xmlDoc.CreateAttribute("C06");
            att.Value = dictionary["GunMaxShot"].ToString();
            nodeItem.Attributes.Append(att);

            att = xmlDoc.CreateAttribute("C07");
            att.Value = dictionary["GunBarrel"].ToString();
            nodeItem.Attributes.Append(att);

            att = xmlDoc.CreateAttribute("C08");
            att.Value = dictionary["GunColor"].ToString();
            nodeItem.Attributes.Append(att);

            att = xmlDoc.CreateAttribute("C09");
            att.Value = dictionary["GunOwner"].ToString();
            nodeItem.Attributes.Append(att);

            att = xmlDoc.CreateAttribute("C10");
            att.Value = dictionary["GunLottotal"].ToString();
            nodeItem.Attributes.Append(att);

            att = xmlDoc.CreateAttribute("C11");
            att.Value = dictionary["GunRemark"].ToString();
            nodeItem.Attributes.Append(att);

            att = xmlDoc.CreateAttribute("C12");
            att.Value = dictionary["GunRegDate"].ToString();
            nodeItem.Attributes.Append(att);

            att = xmlDoc.CreateAttribute("C13");
            att.Value = dictionary["GunCountry"].ToString();
            nodeItem.Attributes.Append(att);

            att = xmlDoc.CreateAttribute("C14");
            att.Value = dictionary["CreateDate"].ToString();
            nodeItem.Attributes.Append(att);

            att = xmlDoc.CreateAttribute("C15");
            att.Value = dictionary["CreateBy"].ToString();
            nodeItem.Attributes.Append(att);

            att = xmlDoc.CreateAttribute("C16");
            att.Value = dictionary["UpdateDate"].ToString();
            nodeItem.Attributes.Append(att);

            att = xmlDoc.CreateAttribute("C17");
            att.Value = dictionary["UpdateBy"].ToString();
            nodeItem.Attributes.Append(att);

            nodeDataGrid.AppendChild(nodeItem);

        }

    }

    public void Xml_add_item(XmlDocument xmlDoc, string nodeXml, int rowItem)
    {

        XmlNode nodeDataGrid = xmlDoc.SelectSingleNode(nodeXml);

        XmlNodeList nodeMeans = nodeDataGrid.SelectNodes("./Means/Mean");

        //XmlNodeList listItem = nodeDataGrid.SelectNodes("./Item");
        //for (int i = 0; i < listItem.Count; i++)
        //{
        //    nodeDataGrid.RemoveChild(listItem[i]);
        //}

        XmlAttribute att;
        XmlNode nodeItem;

        for (int i = 1; i <= rowItem; i++)
        {
            nodeItem = xmlDoc.CreateElement("Item");

            for (int j = 0; j < nodeMeans.Count; j++)
            {
                string Name = "" + nodeMeans[j].Attributes["Name"].Value;
                string colName = "C" + j.ToString().PadLeft(2, '0');
                switch (Name)
                {
                    case "CreateDate":
                    case "UpdateDate":
                        att = xmlDoc.CreateAttribute(colName);
                        att.Value = convertDatetime(DateTime.Now);
                        nodeItem.Attributes.Append(att);
                        break;
                    case "CreateBy":
                    case "UpdateBy":
                        att = xmlDoc.CreateAttribute(colName);
                        att.Value = up._UserName;
                        nodeItem.Attributes.Append(att);
                        break;
                    default:
                        att = xmlDoc.CreateAttribute(colName);
                        att.Value = "";
                        nodeItem.Attributes.Append(att);
                        break;
                }

            }
            nodeDataGrid.AppendChild(nodeItem);
        }

    }

    public void saveDocStandardCode(string strJson)
    {
        XmlDocument xDocStandard;

        strJson = strJson.Replace("[{\"", "").Replace("\"}]", "");
        strJson = strJson.Replace("\",\"", ",").Replace("\":\"", ":");
        strJson = strJson.Replace("\":", ":").Replace(",\"", ",");

        string[] stringSeparators = new string[] { "\"},{\"", "\"}, {\"", "\"} , {\"", "\"} ,{\"" };
        string[] jsonrows = strJson.Split(stringSeparators, StringSplitOptions.None);

        foreach (string strrow in jsonrows)
        {
            string[] rows = strrow.Split(',');
            foreach (string row in rows)
            {
                string strCol = row.Split(':')[0];
                string strValue = row.Split(':')[1];

                string[] arrayStandard = { "GunType", "GunSize", "GunBrand", "GunBarrel", "GunColor", "GunOwner", "GunCountry" };

                WorkSpace.Service WS = new WorkSpace.Service();

                if (Array.IndexOf(arrayStandard, strCol) > -1)
                {
                    string iColumn = strCol.ToUpper();

                    NextwaverDB.NWheres NWS = new NextwaverDB.NWheres();
                    NWS.Add(new NextwaverDB.NWhere(iColumn, strValue));

                    NextwaverDB.NColumns NCS_S = new NextwaverDB.NColumns();
                    NCS_S.Add(new NextwaverDB.NColumn(iColumn));

                    string NCS_Encrypt = new EncryptDecrypt.CryptorEngine().Encrypt(NCS_S.ExportString(), true);
                    string NWS_Encrypt = new EncryptDecrypt.CryptorEngine().Encrypt(NWS.ExportString(), true);

                    DataTable dt = WS.SelectByColumnAndWhere(Connection, OfficeSpaceId, DatabaseName, strCol, NCS_Encrypt, NWS_Encrypt, up._UserName);
                    if (dt.Rows.Count == 0)
                    {
                        string pathDoc = "tempdoc/" + strCol.Trim() + ".xml";
                        xDocStandard = new XmlDocument();
                        xDocStandard.Load(Server.MapPath(pathDoc));

                        NextwaverDB.NColumns NCS = new NextwaverDB.NColumns();
                        NCS.Add(new NextwaverDB.NColumn(iColumn, strValue));

                        string RootPathStandard = "//Document/Data/Section[@ID='1']/Items[@Name='" + strCol + "']";

                        AddDataXmlNode(xDocStandard, RootPathStandard + "/Item[@Name='" + strCol + "']", strValue);

                        string strDoc = xDocStandard.OuterXml;

                        string[] OP = WS.InsertData(Connection, OfficeSpaceId, DatabaseName, strCol, NCS.ExportString(), strDoc, up._UserName);
                    }

                }

            }

        }

    }

    public string convertDatetime(DateTime date)
    {
        int yearTh = date.Year;
        if (yearTh < 2400)
            yearTh = yearTh + 543;

        return date.Day.ToString() + "/" + date.Month.ToString() + "/" + yearTh.ToString() + " " + date.Hour.ToString() + ":" + date.Minute.ToString() + ":" + date.Second.ToString();
    }

    private void fnSearchDataGun()
    {
        Random RD = new Random();
        int SRD = RD.Next(9999, 100000);

        string DateStart = "" + Request.Params["datestart"];
        string DateEnd = "" + Request.Params["dateend"];
        string pStatus = "" + Request.Params["pstatus"];

        Session["DateStart" + SRD.ToString()] = DateStart;
        Session["DateEnd" + SRD.ToString()] = DateEnd;
        Session["pStatus" + SRD.ToString()] = pStatus;

        string SOutput = "{\"SRD\":\"" + SRD + "\"}";
        Response.Write(SOutput);
    }

    private void fnLoadDataGun()
    {

        string SRD = Request.Params["SRD"];

        string DateStart = "" + Session["DateStart" + SRD];
        string DateEnd = "" + Session["DateEnd" + SRD];
        string pStatus = "" + Session["pStatus" + SRD];

        string[] DateStartArray = DateStart.Split('-');
        string[] DateEndArray = DateEnd.Split('-');

        if (int.Parse(DateStartArray[0]) < 2300)
        {
            DateStartArray[0] = (int.Parse(DateStartArray[0]) + 543).ToString();
        }
        if (int.Parse(DateEndArray[0]) < 2300)
        {
            DateEndArray[0] = (int.Parse(DateEndArray[0]) + 543).ToString();
        }

        DateStart = DateStartArray[0] + DateStartArray[1] + DateStartArray[2];
        DateEnd = DateEndArray[0] + DateEndArray[1] + DateEndArray[2];

        GRB_WebService.GRB_WebService GRB_ws = new GRB_WebService.GRB_WebService();
        DataTable dt = GRB_ws.GetDataGun(DateStart, DateEnd, pStatus);

        string SRow = Data_To_JSON(dt);

        string SOutput = "{\"records\":[" + SRow + "]" +
            ",\"sdate\":\"" + "" + Session["DateStart" + SRD] + "\"" +
            ",\"edate\":\"" + "" + Session["DateEnd" + SRD] + "\"" +
            ",\"pstatus\":\"" + pStatus + "\"" +
            "}";
        Response.Write(SOutput);
    }

    private void ExportCsv()
    {
        try
        {

            string attachment = "attachment; filename=MyCsvLol.csv";
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.AddHeader("content-disposition", attachment);
            HttpContext.Current.Response.ContentType = "text/csv";
            HttpContext.Current.Response.AddHeader("Pragma", "public");

            StringBuilder sb = new StringBuilder();

            sb.AppendLine("aaa");

            HttpContext.Current.Response.Write(sb.ToString());

        }
        catch (Exception ex)
        {

        }

        //Response.Write("");
    }

    private void fnLoadGunReg()
    {
        string GunRegID = Request.Params["GunRegID"];
        string GunNo = Request.Params["GunNo"];
        string GunGroup = Request.Params["GunGroup"];

        string GunType = Request.Params["GunType"];
        string GunBrand = Request.Params["GunBrand"];
        string GunCountry = Request.Params["GunCountry"];

        string GunSize = Request.Params["GunSize"];
        string GunOwner = Request.Params["GunOwner"];
        string GunRemark = Request.Params["GunRemark"];

        GRB_WebService.GRB_WebService GRB_ws = new GRB_WebService.GRB_WebService();
        DataTable dt = GRB_ws.GetTblGunReg(0, 0, 0, GunRegID, GunNo, GunGroup, GunType, GunSize, GunBrand, 0, "", "", GunOwner, "", GunRemark, GunCountry,0);

        string SRow = Data_To_JSON(dt);

        string SOutput = "{\"records\":[" + SRow + "]" + "}";
        Response.Write(SOutput);
    }

    private void fnSaveLogUser(string Menu, string Process, string Detail)
    {
        UserProfile up = UserProfile.getProfile();

        GRB_WebService.GRB_WebService GRB_ws = new GRB_WebService.GRB_WebService();
        GRB_ws.logUser(up._UserName, Menu, Process, true, Detail);
    }

    private void fnLoadPDF()
    {
        try
        {
            GRB_WebService.GRB_WebService GRB_ws = new GRB_WebService.GRB_WebService();
            byte[] byteimg = GRB_ws.getPDF("imageBookGunReg/BTEST.pdf");

            string pdfdata = Convert.ToBase64String((byte[])byteimg);

            string OUTPUT = "{\"output\":\"OK\"";
            OUTPUT += ",\"dataStr\":\"" + pdfdata + "\"";
            OUTPUT += "}";

            Response.Write(OUTPUT);
            return;
        }
        catch (Exception ex)
        {
            Response.Write("{\"output\":\"ERROR\",\"MSG\":\"ไม่มีรูปภาพ\"}");
            return;
        }
    }

    private void fnLoadDataEntryCur()
    {
        //DateTime testDate = new DateTime(2017, 12, 1);

        string strYear = DateTime.Now.Year.ToString();
        if (DateTime.Now.Year < 2300)
            strYear = "" + (DateTime.Now.Year + 543);

        string dateCur = strYear + DateTime.Now.ToString("MMdd");
        string pStatus = "Submit";

        GRB_WebService.GRB_WebService GRB_ws = new GRB_WebService.GRB_WebService();
        DataTable dt = GRB_ws.GetDataGunSum(dateCur, dateCur, pStatus);

        string SRow = Data_To_JSON(dt);

        string SOutput = "{\"records\":[" + SRow + "]" + "}";
        //",\"sdate\":\"" + "" + Session["DateStart" + SRD] + "\"" +
        //",\"edate\":\"" + "" + Session["DateEnd" + SRD] + "\"" +
        //",\"pstatus\":\"" + pStatus + "\"" +
        //"}";
        Response.Write(SOutput);
    }

    private void fnLoadTblGunBook()
    {
        string GunBookNo = Request.Params["GunBookNo"];
        string GunYear = Request.Params["GunYear"];

        int intGunBookNo = (GunBookNo != "" && GunBookNo != null) ? Convert.ToInt32(GunBookNo) : 0;
        int intGunYear = (GunYear != "" && GunYear != null) ? Convert.ToInt32(GunYear) : 0;

        GRB_WebService.GRB_WebService GRB_ws = new GRB_WebService.GRB_WebService();
        DataTable dt = GRB_ws.GetBookByCondition(intGunBookNo, intGunYear);

        string[] fileList = System.IO.Directory.GetFiles("//" + strHostName + pathEBook, "*.pdf", SearchOption.AllDirectories);

        string allNamefile = "";
        foreach (string file in fileList)
        {
            allNamefile += "," + Path.GetFileName(file);
        };

        allNamefile.Replace("B", "").Replace(".pdf", "");

        dt.Columns.Add("GenEBook", typeof(System.String));

        foreach (DataRow row in dt.Rows)
        {
            if (allNamefile.Contains(row["BookNo"].ToString()))
                row["GenEBook"] = "Yes";
            else
                row["GenEBook"] = "No";
        }

        string SRow = Data_To_JSON(dt);

        string SOutput = "{\"records\":[" + SRow + "]" + "}";
        //",\"sdate\":\"" + "" + Session["DateStart" + SRD] + "\"" +
        //",\"edate\":\"" + "" + Session["DateEnd" + SRD] + "\"" +
        //",\"pstatus\":\"" + pStatus + "\"" +
        //"}";
        Response.Write(SOutput);

    }

    private void fnCheckBookNo()
    {
        string Result = "F";
        string GunBookNo = "0000" + Request.Params["GunBookNo"];
        string GunBookYear = "Y" + Request.Params["GunBookYear"];

        GunBookNo = "B" + GunBookNo.Substring(GunBookNo.Length - 4);

        if (File.Exists("//" + strHostName + pathEBook + "Active/" + GunBookYear + "/" + GunBookNo + ".pdf"))
            Result = "T";

        string SOutput = "{\"Result\":\"" + Result + "\"" + "}";
        Response.Write(SOutput);

    }

    private void fnCheckGenBook()
    {
        string Result = "F";
        string msg = "";
        string GunBookNo = "0000" + Request.Params["GunBookNo"].Split(',')[1];
        string GunBookYear = "Y" + Request.Params["GunBookNo"].Split(',')[0];

        int totalPage = Convert.ToInt32(Request.Params["GunBookNo"].Split(',')[2]);

        GunBookNo = "B" + GunBookNo.Substring(GunBookNo.Length - 4);

        string pathImage = "//" + strHostName + pathImg + "Active/" + GunBookYear + "/" + GunBookNo;

        string[] fileList = null;
        if (System.IO.Directory.Exists(pathImage))
        {
            fileList = System.IO.Directory.GetFiles(pathImage, "*.jpg", SearchOption.TopDirectoryOnly);
        }

        if (!System.IO.Directory.Exists(pathImage))
        {
            msg = "ไม่มีข้อมูลการแสกนหนังสือเล่มนี้";
            Result = "N";
        }
        else if (totalPage <= fileList.Length)
            Result = "T";
        else
            msg = "มีข้อมูลน้อยกว่าจำนวนหน้า";


        string SOutput = "{\"Result\":\"" + Result + "\""
            + ", \"Msg\":\"" + msg + "\""
            + "}";
        Response.Write(SOutput);

    }

    private void fnGenPDF()
    {
        string GunBookNo = "0000" + Request.Params["GunBookNo"].Split(',')[1];
        string GunBookYear = "Y" + Request.Params["GunBookNo"].Split(',')[0];
        GunBookNo = "B" + GunBookNo.Substring(GunBookNo.Length - 4);

        string Result = "F";
        string pathImage = "//" + strHostName + pathImg + "Active/" + GunBookYear + "/" + GunBookNo;

        if (System.IO.Directory.Exists(pathImage))
        {
            ProcessStartInfo processInfo = new ProcessStartInfo(Server.MapPath("../GenEbook/GRB.Console.exe"));
            processInfo.CreateNoWindow = true;
            processInfo.UseShellExecute = false;
            processInfo.Arguments = "GENPDF " + GunBookNo + " Active\\" + GunBookYear + "\\" + GunBookNo;
            Process process = Process.Start(processInfo);

            process.WaitForExit();
            if (process.ExitCode == 0)
                Result = "T";
        }
        string SOutput = "{\"Result\":\"" + Result + "\"" + "}";
        Response.Write(SOutput);
    }

    private void fnLoadTaskBook()
    {
        string Result = "";

        //string text = File.ReadAllText(Server.MapPath(@"..\GenBookTask\file.txt"), Encoding.UTF8);
        try
        {
            string[] readText = File.ReadAllLines(Server.MapPath(@"..\GenBookTask\file.txt"), Encoding.UTF8);

            foreach (string s in readText)
            {
                if (s.Trim() != "")
                {
                    string strRow = "";

                    string[] listparam = s.Split('&');
                    foreach (string item in listparam)
                    {
                        strRow += ",\"" + item.Split('=')[0] + "\": \"" + item.Split('=')[1] + "\"";
                    }
                    Result += ",{" + strRow.Substring(1) + "}";
                }
            }
            Result = Result.Substring(1);
        }
        catch (Exception)
        {

        }

        string SOutput = "{\"Result\":[" + Result + "]}";
        Response.Write(SOutput);

    }

    private void fnSaveTaskBook()
    {
        string Result = "";

        try
        {
            string strJson = Request.Params["record"].Replace("[{\"", "").Replace("\"}]", "");

            string[] stringSeparators = new string[] { "\"},{\"", "\"}, {\"", "\"} , {\"", "\"} ,{\"" };
            string[] jsonrows = strJson.Split(stringSeparators, StringSplitOptions.None);

            string[] stringRows = new string[] { "\",\"", ",\"" };
            string[] stringData = new string[] { "\":\"", "\":" };

            File.WriteAllText(Server.MapPath(@"..\GenBookTask\file.txt"), String.Empty);

            foreach (string strrow in jsonrows)
            {
                string strRow = "";
                string[] rows = strrow.Split(stringRows, StringSplitOptions.None);
                foreach (string row in rows)
                {
                    string strCol = row.Split(stringData, StringSplitOptions.None)[0];
                    string strValue = row.Split(stringData, StringSplitOptions.None)[1];
                    strRow += "&" + strCol + "=" + strValue;
                }
                File.AppendAllText(Server.MapPath(@"..\GenBookTask\file.txt"), strRow.Substring(1) + Environment.NewLine);
            }
            Result = "OK";
        }
        catch (Exception ex)
        {

        }
        string SOutput = "{\"Result\":\"" + Result + "\"}";
        Response.Write(SOutput);

    }

    private void fnCountDataAll()
    {
        try
        {
            GRB_WebService.GRB_WebService GRB_ws = new GRB_WebService.GRB_WebService();
            DataTable dtCountAllData = GRB_ws.countAllData();
            DataTable dtCountAllByYear = GRB_ws.countAllDataByYear();
            DataTable dtCountAllByBook = GRB_ws.countAllDataByBook();

            UserProfile up = UserProfile.getProfile();

            string UserName = up._UserName;
            string CountBook = dtCountAllData.Rows[0][0].ToString();
            string CountPage = dtCountAllData.Rows[0][1].ToString();
            string CountRecode = dtCountAllData.Rows[0][2].ToString();

            string jsonCountByYear = Data_To_JSON(dtCountAllByYear);
            jsonCountByYear = "[" + jsonCountByYear + "]";

            string jsonCountByBook = Data_To_JSON(dtCountAllByBook);
            jsonCountByBook = "[" + jsonCountByBook + "]";

            string OUTPUT = "{\"output\":\"OK\"";
            OUTPUT += ",\"USERNAME\":\"" + UserName + "\"";
            OUTPUT += ",\"COUNTBOOK\":\"" + CountBook + "\"";
            OUTPUT += ",\"COUNTPAGE\":\"" + CountPage + "\"";
            OUTPUT += ",\"COUNTRECODE\":\"" + CountRecode + "\"";
            OUTPUT += ",\"DATACOUNTBYYEAR\":" + jsonCountByYear + "";
            OUTPUT += ",\"DATACOUNTBYBOOK\":" + jsonCountByBook + "";
            OUTPUT += "}";
            Response.Write(OUTPUT);
        }
        catch (Exception)
        {
            Response.Write("{\"output\":\"ERROR\",\"MSG\":\"ไม่สามารถโหลดข้อมูลได้\"}");
        }

    }

    private void fnDataReportImage()
    {
        try
        {
            GRB_WebService.GRB_WebService GRB_ws = new GRB_WebService.GRB_WebService();
            DataTable dt = GRB_ws.reportImgErr();
            
            string jsondata = Data_To_JSON(dt);
            jsondata = "[" + jsondata + "]";
            

            string OUTPUT = "{\"output\":\"OK\"";
            OUTPUT += ",\"DATAIMG\":" + jsondata + "";
            OUTPUT += "}";
            Response.Write(OUTPUT);
        }
        catch (Exception)
        {
            Response.Write("{\"output\":\"ERROR\",\"MSG\":\"ไม่สามารถโหลดข้อมูลได้\"}");
        }

    }


}