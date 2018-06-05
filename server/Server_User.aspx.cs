using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

public partial class server_Server_User : System.Web.UI.Page
{
    string Connection = "NextwaverDatabase";
    string OfficeSpaceId = "OF.0001";
    string DatabaseName = "desktop";
    
    protected void Page_Load(object sender, EventArgs e)
    {
        string Command = Request.Params["Command"];
        switch (Command)
        {
            case "LoadMenu": fnLoadMenu(); break;
            case "LoadPosition": fnLoadPosition(); break;
            case "SavePosition": fnSavePosition(); break;
            case "SaveUser": fnSaveUser(); break;
            case "LoadDataUser": fnLoadDataUser(); break;
            case "DeleteUser": fnDeleteUser(); break;
            case "DeletePosition": fnDeletePosition(); break;
            case "SaveWaterMask": fnSaveWaterMaskDoc(); break;
            case "LoadDataWaterMask": fnLoadDataWaterMask(); break;
            case "DeleteWaterMask": fnDeleteWaterMask(); break;
            case "ReportLogs": fnReportLogs(); break;


                
        }
    }

    #region ReportLogs 
    private void fnReportLogs()
    {

    }
    #endregion

    private void fnSaveLogUser(string Menu, string Process, string Detail, bool Result)
    {
        UserProfile up = UserProfile.getProfile();

        GRB_WebService.GRB_WebService GRB_ws = new GRB_WebService.GRB_WebService();
        GRB_ws.logUser(up._UserName, Menu, Process, Result, Detail);
    }

    #region save waterMask

    private void fnUploadPicWaterMask(string year,string depName,string otherGroup)
    {
        string set_imgFileName = "";
        if (year != "")
        {
            set_imgFileName = "Y" + year.Trim() + ".png";
        }
        else if(depName!="")
        {

            set_imgFileName = depName.Trim() + ".png";
        }
        else
        {
            set_imgFileName = otherGroup.Trim() + ".png";
        }
        string _imgFileName = set_imgFileName;
        path_image = _imgFileName;

        try
        {
            UserProfile up = UserProfile.getProfile();
            byte[] imageByte = Convert.FromBase64String(_imgBase64);
            GRB_WebService.GRB_WebService GRB_ws = new GRB_WebService.GRB_WebService();
            GRB_ws.SaveWaterMask(_imgFileName, imageByte);
           // Response.Write("{\"output\":\"ERROR\",\"MSG\":\"อัพเดทเวอร์ชันเอกสารสำเร็จ\"}");
        }
        catch
        {
            Response.Write("{\"output\":\"ERROR\",\"MSG\":\"ไม่สามารถอัพโหลดลายน้ำได้\"}");
        }
    }
    string path_image;
    string _imgBase64;
    private void fnSaveWaterMaskDoc()
    {
        UserProfile up = UserProfile.getProfile();
       
        string ID = Request.Params["ID"];
        string maskYear = Request.Params["maskYear"];
        string departmentName = Request.Params["departName"];
        string otherGroup = Request.Params["otherG"];
        string groupType = "";
        string nameWater = "";

        if (maskYear != "")
        {
            groupType = "กลุ่มตามปี";
            nameWater = maskYear;
        }  
        else if(departmentName != "")
        {
            groupType = "กลุ่มตามหน่วยงาน";
            nameWater = departmentName;
        }   
        else
        {
            groupType = "กลุ่มอื่นๆ";
            nameWater = otherGroup;
        }

        _imgBase64 = Request.Params["imgBase64"];

        if (ID == "null") ID = "";
            
        string Command = "New";
        if (ID != "") Command = "Edit";

        WorkSpace.Service WS = new WorkSpace.Service();
        NextwaverDB.NWheres NWS = new NextwaverDB.NWheres();

        if (maskYear != "" || departmentName != "" || otherGroup !="")
        {
            NWS.whereType = true;
            string _where = "", _nColumn = "", _ms = "";
            if (maskYear != "")
            {
                
                _where = "[@WATERMASK_NAME@ = '" + maskYear + "']";
                _nColumn = "WATERMASK_NAME";
                _ms = "{\"output\":\"ERROR\",\"MSG\":\"ลายน้ำของปีนี้มีอยู่แล้วในระบบ โปรดระบุใหม่\"}";

            }
            else if (departmentName != "")
            {
                groupType = "กลุ่มตามหน่วยงาน";
                _where = "[@WATERMASK_NAME@ = '" + departmentName + "']";
                _nColumn = "WATERMASK_NAME";
                _ms = "{\"output\":\"ERROR\",\"MSG\":\"ขื่อนี้มีอยู่แล้วในระบบ โปรดระบุใหม่\"}";
            }
            else
            {
                _where = "[@WATERMASK_NAME@ = '" + otherGroup + "']";
                _nColumn = "WATERMASK_NAME";
                _ms = "{\"output\":\"ERROR\",\"MSG\":\"ขื่อนี้มีอยู่แล้วในระบบ โปรดระบุใหม่\"}";
            }

            NWS.Where = _where;
            if (Command != "New")
            {
                NWS.Where += "[@ID@ != '" + ID + "']";
            }

            NextwaverDB.NColumns NCS_S = new NextwaverDB.NColumns();
            NCS_S.Add(new NextwaverDB.NColumn(_nColumn));

            string NCS_Encrypt = new EncryptDecrypt.CryptorEngine().Encrypt(NCS_S.ExportString(), true);
            string NWS_Encrypt = new EncryptDecrypt.CryptorEngine().Encrypt(NWS.ExportString(), true);

            DataTable dt = WS.SelectByColumnAndWhere(Connection, OfficeSpaceId, DatabaseName, "WaterMask", NCS_Encrypt, NWS_Encrypt, up._UserName);

            if (dt.Rows.Count > 0)
            {
                Response.Write(_ms);
                return;
            }

        }
        if (_imgBase64 != "")
        {
            fnUploadPicWaterMask(maskYear, departmentName, otherGroup);
        }
        if (Command == "New")
        {
            NextwaverDB.NColumns NCS = new NextwaverDB.NColumns();
            NCS.Add(new NextwaverDB.NColumn("GROUP_TYPE", groupType));
            NCS.Add(new NextwaverDB.NColumn("WATERMASK_NAME", nameWater));
            NCS.Add(new NextwaverDB.NColumn("FILE_NAME", path_image));
            NCS.Add(new NextwaverDB.NColumn("CREATE_DATE", DateTime.Now.ToString("dd/MM/yyyy")));
            NCS.Add(new NextwaverDB.NColumn("CREATE_BY", up._UserName));
            NCS.Add(new NextwaverDB.NColumn("UPDATE_DATE", DateTime.Now.ToString("dd/MM/yyyy")));
            NCS.Add(new NextwaverDB.NColumn("UPDATE_BY", up._UserName));

            string[] OP = WS.InsertData(Connection, OfficeSpaceId, DatabaseName, "WaterMask", NCS.ExportString(), "", "");

            if (OP[0].ToUpper() == "OK")
            {
                fnSaveLogUser("ระบบจัดการลายน้ำ", "Save", "สร้างข้อมูลลายน้ำ", true);
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
            NextwaverDB.NColumns NCS = new NextwaverDB.NColumns();
            NCS.Add(new NextwaverDB.NColumn("GROUP_TYPE", groupType));
            NCS.Add(new NextwaverDB.NColumn("WATERMASK_NAME", nameWater));
            NCS.Add(new NextwaverDB.NColumn("FILE_NAME", path_image));
            NCS.Add(new NextwaverDB.NColumn("UPDATE_DATE", DateTime.Now.ToString("dd/MM/yyyy")));
            NCS.Add(new NextwaverDB.NColumn("UPDATE_BY", up._UserName));

            NWS = new NextwaverDB.NWheres();
            NWS.Add("ID", ID);

            string[] OP = WS.UpdateData(Connection, OfficeSpaceId, DatabaseName, "WaterMask", NCS.ExportString(), NWS.ExportString(), "", "");

            if (OP[0].ToUpper() == "OK")
            {
                fnSaveLogUser("ระบบจัดการลายน้ำ", "Edit", "แก้ไขข้อมูลลายน้ำ", true);
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


    private void fnLoadDataWaterMask()
    {
        string ID = Request.Params["ID"];
        WorkSpace.Service WS = new WorkSpace.Service();
        NextwaverDB.NWheres NWS = new NextwaverDB.NWheres();
        NWS.whereType = true;
        NWS.Where += "[@ID@ = '" + ID + "']";

        string NWS_Encrypt = new EncryptDecrypt.CryptorEngine().Encrypt(NWS.ExportString(), true);
        try
        {
            DataTable dt = WS.SelectAllColumnByWhere(Connection, OfficeSpaceId, DatabaseName, "WaterMask", NWS.ExportString(), "system");

            string GROUP_TYPE = "" + dt.Rows[0]["GROUP_TYPE"];
            string WATERMASK_NAME = "" + dt.Rows[0]["WATERMASK_NAME"];
            //string OTHERGROUP = "" + dt.Rows[0]["OTHERGROUP_NAME"];

            string OUTPUT = "{\"output\":\"OK\"";
            OUTPUT += ",\"GROUP_TYPE\":\"" + GROUP_TYPE + "\"";
            OUTPUT += ",\"WATERMASK_NAME\":\"" + WATERMASK_NAME + "\"";
            OUTPUT += "}";
            Response.Write(OUTPUT);
        }
        catch (Exception ex)
        {
            Response.Write("{\"output\":\"ERROR\",\"MSG\":\"ไม่สามารถโหลดข้อมูลได้\"}");
        }
    }


    private void fnDeleteWaterMask()
    {
        string ID_LIST = Request.Params["ID_LIST"];
        string[] SP = ID_LIST.Split(new char[] { ',' });
        int CountOK = 0;
        try
        {
            WorkSpace.Service WS = new WorkSpace.Service();
            for (int i = 0; i < SP.Length; i++)
            {
                NextwaverDB.NColumns NCS = new NextwaverDB.NColumns();
                NCS.Add(new NextwaverDB.NColumn("STATUS", "D"));
                NCS.Add(new NextwaverDB.NColumn("UPDATE_DATE", DateTime.Now.ToString("dd/MM/yyyy")));
                NCS.Add(new NextwaverDB.NColumn("UPDATE_BY", "system"));

                NextwaverDB.NWheres NWS = new NextwaverDB.NWheres();
                NWS.Add("ID", SP[i]);

                string[] OP = WS.UpdateData(Connection, OfficeSpaceId, DatabaseName, "WaterMask", NCS.ExportString(), NWS.ExportString(), "", "");
                CountOK++;
            }

            Response.Write("{\"output\":\"OK\"}");
        }
        catch { Response.Write("{\"output\":\"ERROR\",\"MSG\":\"ลบข้อมูลสำเร็จทั้งหมด " + CountOK + " จาก " + SP.Length + " รายการ\"}"); }


        //Response.Write("{\"output\":\"OK\"}");
    }
    #endregion
    private void fnDeletePosition()
    {
        string ID_LIST = Request.Params["ID_LIST"];
        string[] SP = ID_LIST.Split(new char[] { ',' });
        int CountOK = 0;
        try
        {
            WorkSpace.Service WS = new WorkSpace.Service();
            for (int i = 0; i < SP.Length; i++)
            {
                NextwaverDB.NColumns NCS = new NextwaverDB.NColumns();
                NCS.Add(new NextwaverDB.NColumn("STATUS", "D"));
                NCS.Add(new NextwaverDB.NColumn("UPDATE_DATE", DateTime.Now.ToString("dd/MM/yyyy")));
                NCS.Add(new NextwaverDB.NColumn("UPDATE_BY", "system"));

                NextwaverDB.NWheres NWS = new NextwaverDB.NWheres();
                NWS.Add("ID", SP[i]);

                string[] OP = WS.UpdateData(Connection, OfficeSpaceId, DatabaseName, "position", NCS.ExportString(), NWS.ExportString(), "", "");
                CountOK++;
            }

            Response.Write("{\"output\":\"OK\"}");
        }
        catch { Response.Write("{\"output\":\"ERROR\",\"MSG\":\"ลบข้อมูลสำเร็จทั้งหมด " + CountOK + " จาก " + SP.Length + " รายการ\"}"); }


        //Response.Write("{\"output\":\"OK\"}");
    }
    private void fnDeleteUser()
    {
        string ID_LIST = Request.Params["ID_LIST"];
        string[] SP = ID_LIST.Split(new char[] { ',' });
        int CountOK = 0;
        try
        {
            WorkSpace.Service WS = new WorkSpace.Service();
            for (int i = 0; i < SP.Length; i++)
            {
                NextwaverDB.NColumns NCS = new NextwaverDB.NColumns();
                NCS.Add(new NextwaverDB.NColumn("STATUS", "D"));
                NCS.Add(new NextwaverDB.NColumn("UPDATE_DATE", DateTime.Now.ToString("dd/MM/yyyy")));
                NCS.Add(new NextwaverDB.NColumn("UPDATE_BY", "system"));

                NextwaverDB.NWheres NWS = new NextwaverDB.NWheres();
                NWS.Add("ID", SP[i]);
               
                string[] OP = WS.UpdateData(Connection, OfficeSpaceId, DatabaseName, "users", NCS.ExportString(), NWS.ExportString(), "", "");
                CountOK++;
            }

            Response.Write("{\"output\":\"OK\"}");
        }
        catch { Response.Write("{\"output\":\"ERROR\",\"MSG\":\"ลบข้อมูลสำเร็จทั้งหมด "+CountOK+" จาก "+SP.Length+" รายการ\"}"); }

       
        //Response.Write("{\"output\":\"OK\"}");
    }
    private void fnLoadDataUser()
    {
        string ID = Request.Params["ID"];
        WorkSpace.Service WS = new WorkSpace.Service();
        NextwaverDB.NWheres NWS = new NextwaverDB.NWheres();
        NWS.whereType = true;
        NWS.Where += "[@ID@ = '" + ID + "']";
      
        string NWS_Encrypt = new EncryptDecrypt.CryptorEngine().Encrypt(NWS.ExportString(), true);
        try
        {
            DataTable dt = WS.SelectAllColumnByWhere(Connection, OfficeSpaceId, DatabaseName, "users", NWS.ExportString(), "system");

            string USERNAME = "" + dt.Rows[0]["USERNAME"];
            string PASSWORD = "" + dt.Rows[0]["PASSWORD"];
            string TITLE = "" + dt.Rows[0]["TITLE"];
            string FIRSTNAME = "" + dt.Rows[0]["FIRSTNAME"];
            string LASTNAME = "" + dt.Rows[0]["LASTNAME"];
            string POSITION_CODE = "" + dt.Rows[0]["POSITION_CODE"];

            string OUTPUT = "{\"output\":\"OK\"";
            OUTPUT += ",\"USERNAME\":\"" + USERNAME + "\"";
            OUTPUT += ",\"PASSWORD\":\"" + PASSWORD + "\"";
            OUTPUT += ",\"TITLE\":\"" + TITLE + "\"";
            OUTPUT += ",\"FIRSTNAME\":\"" + FIRSTNAME + "\"";
            OUTPUT += ",\"LASTNAME\":\"" + LASTNAME + "\"";
            OUTPUT += ",\"POSITION_CODE\":\"" + POSITION_CODE + "\"";
            OUTPUT += "}";
            Response.Write(OUTPUT);
        }
        catch (Exception ex)
        {
            Response.Write("{\"output\":\"ERROR\",\"MSG\":\"ไม่สามารถโหลดข้อมูลได้\"}");
        }
    }
    private void fnSaveUser()
    {
        string ID = Request.Params["ID"];
        string username = Request.Params["username"];
        string password = Request.Params["password"];
        string usertype = Request.Params["usertype"];
        string title = Request.Params["title"];
        string firstname = Request.Params["firstname"];
        string lastname = Request.Params["lastname"];

        string Command = "New";
        if (ID != "") Command = "Edit";

        WorkSpace.Service WS = new WorkSpace.Service();
        NextwaverDB.NWheres NWS = new NextwaverDB.NWheres();
        NWS.whereType = true;
        NWS.Where = "[@USERNAME@ = '" + username + "']";
        if (Command != "New")
        {
            NWS.Where += "[@ID@ != '" + ID + "']";
        }

        NextwaverDB.NColumns NCS_S = new NextwaverDB.NColumns();
        NCS_S.Add(new NextwaverDB.NColumn("USERNAME"));

        string NCS_Encrypt = new EncryptDecrypt.CryptorEngine().Encrypt(NCS_S.ExportString(), true);
        string NWS_Encrypt = new EncryptDecrypt.CryptorEngine().Encrypt(NWS.ExportString(), true);

        DataTable dt = WS.SelectByColumnAndWhere(Connection, OfficeSpaceId, DatabaseName, "users", NCS_Encrypt, NWS_Encrypt, "system");
        if (dt.Rows.Count > 0)
        {
            Response.Write("{\"output\":\"ERROR\",\"MSG\":\"ชื่อผู้ใช้งานนี้มีอยู่แล้วในระบบโปรดระบุใหม่\"}");
            return;
        }

        if (Command == "New")
        {
            NextwaverDB.NColumns NCS = new NextwaverDB.NColumns();
            NCS.Add(new NextwaverDB.NColumn("USERNAME", username));
            NCS.Add(new NextwaverDB.NColumn("PASSWORD", password));
            NCS.Add(new NextwaverDB.NColumn("TITLE", title));
            NCS.Add(new NextwaverDB.NColumn("FIRSTNAME", firstname));
            NCS.Add(new NextwaverDB.NColumn("LASTNAME", lastname));
            NCS.Add(new NextwaverDB.NColumn("POSITION_CODE", usertype));
            NCS.Add(new NextwaverDB.NColumn("CREATE_DATE", DateTime.Now.ToString("dd/MM/yyyy")));
            NCS.Add(new NextwaverDB.NColumn("CREATE_BY", "system"));
            NCS.Add(new NextwaverDB.NColumn("UPDATE_DATE", DateTime.Now.ToString("dd/MM/yyyy")));
            NCS.Add(new NextwaverDB.NColumn("UPDATE_BY", "system"));
           
            string[] OP = WS.InsertData(Connection, OfficeSpaceId, DatabaseName, "users", NCS.ExportString(), "", "");

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
            NextwaverDB.NColumns NCS = new NextwaverDB.NColumns();
            NCS.Add(new NextwaverDB.NColumn("PASSWORD", password));
            NCS.Add(new NextwaverDB.NColumn("TITLE", title));
            NCS.Add(new NextwaverDB.NColumn("FIRSTNAME", firstname));
            NCS.Add(new NextwaverDB.NColumn("LASTNAME", lastname));
            NCS.Add(new NextwaverDB.NColumn("POSITION_CODE", usertype));
            NCS.Add(new NextwaverDB.NColumn("UPDATE_DATE", DateTime.Now.ToString("dd/MM/yyyy")));
            NCS.Add(new NextwaverDB.NColumn("UPDATE_BY", "system"));

            NWS = new NextwaverDB.NWheres();
            NWS.Add("ID", ID);

            string[] OP = WS.UpdateData(Connection, OfficeSpaceId, DatabaseName, "users", NCS.ExportString(), NWS.ExportString(), "", "");

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
    private void fnSavePosition()
    {
       
        string POSITION_NAME = Request.Params["Name"];
        string ID_List = Request.Params["ID_List"];
        string PARENT_CODE = Request.Params["parent"];
        string ID = Request.Params["ID"];

        if (ID == "")
        {
            NextwaverDB.NColumns NCS = new NextwaverDB.NColumns();
            NCS.Add(new NextwaverDB.NColumn("POSITION_CODE", PARENT_CODE + getNewPOSITION_CODE(PARENT_CODE)));
            NCS.Add(new NextwaverDB.NColumn("POSITION_NAME", POSITION_NAME));
            NCS.Add(new NextwaverDB.NColumn("PARENT_CODE", PARENT_CODE));
            NCS.Add(new NextwaverDB.NColumn("CREATE_DATE", DateTime.Now.ToString("dd/MM/yyyy")));
            NCS.Add(new NextwaverDB.NColumn("CREATE_BY", ""));
            NCS.Add(new NextwaverDB.NColumn("UPDATE_DATE", DateTime.Now.ToString("dd/MM/yyyy")));
            NCS.Add(new NextwaverDB.NColumn("UPDATE_BY", ""));
            NCS.Add(new NextwaverDB.NColumn("MENU", ID_List));

            WorkSpace.Service WS = new WorkSpace.Service();
            string[] OP = WS.InsertData(Connection, OfficeSpaceId, DatabaseName, "position", NCS.ExportString(), "", "");

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
            NextwaverDB.NColumns NCS = new NextwaverDB.NColumns();
            NCS.Add(new NextwaverDB.NColumn("POSITION_NAME", POSITION_NAME));
            NCS.Add(new NextwaverDB.NColumn("UPDATE_DATE", DateTime.Now.ToString("dd/MM/yyyy")));
            NCS.Add(new NextwaverDB.NColumn("UPDATE_BY", ""));
            NCS.Add(new NextwaverDB.NColumn("MENU", ID_List));
            NextwaverDB.NWheres NWS = new NextwaverDB.NWheres();
            NWS.Add("ID", ID);

            WorkSpace.Service WS = new WorkSpace.Service();
            string[] OP = WS.UpdateData(Connection, OfficeSpaceId, DatabaseName, "position", NCS.ExportString(), NWS.ExportString(), "", "");

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
    string checkMENU(string[] SP,string ID)
    {
        if (SP == null) return "0";
        for(int z = 0; z < SP.Length; z++)
        {
            if (SP[z] == ID) return "1";
        }
        return "0";
    }
    string getNewPOSITION_CODE(string PARENT_CODE)
    {
        NextwaverDB.NXPath NXP = new NextwaverDB.NXPath();
        NextwaverDB.NWheres NWS = new NextwaverDB.NWheres();
        NWS.whereType = true;
        NWS.Where = "[" + NXP.getMaxValue("@POSITION_CODE@") + "]";
        NWS.Where += "[@PARENT_CODE@ = '" + PARENT_CODE + "']";

        NextwaverDB.NColumns NCS_S = new NextwaverDB.NColumns();
        NCS_S.Add(new NextwaverDB.NColumn("POSITION_CODE"));

        string NCS_Encrypt = new EncryptDecrypt.CryptorEngine().Encrypt(NCS_S.ExportString(), true);
        string NWS_Encrypt = new EncryptDecrypt.CryptorEngine().Encrypt(NWS.ExportString(), true);
        
        WorkSpace.Service WS = new WorkSpace.Service();

       
        DataTable dt = WS.SelectByColumnAndWhere(Connection, OfficeSpaceId, DatabaseName, "position", NCS_Encrypt, NWS_Encrypt,"system");
        int MaxID = 0;
        try
        {
            string PC = dt.Rows[0][0].ToString();
            if (PARENT_CODE != "")
                PC = PC.Replace(PARENT_CODE, "");
            MaxID = int.Parse(PC);

        }
        catch { }

        string NewID = "" + (MaxID + 1);
        for (int i = NewID.Length; i < 3; i++)
        {
            NewID = "0" + NewID;
        }
        return NewID;
    }
    private void fnLoadPosition()
    {
        string pID = Request.Params["ID"];
        string tmpPARENT_CODE = "";

        WorkSpace.Service WS = new WorkSpace.Service();
        if (pID != "")
        {
            
            NextwaverDB.NWheres NWS = new NextwaverDB.NWheres();
            NWS.whereType = true;
            NWS.Where += "[@ID@ = '" + pID + "']";

            string NWS_Encrypt = new EncryptDecrypt.CryptorEngine().Encrypt(NWS.ExportString(), true);
            try
            {
                DataTable tmp_dt = WS.SelectAllColumnByWhere(Connection, OfficeSpaceId, DatabaseName, "position", NWS.ExportString(), "system");
                tmpPARENT_CODE = "" + tmp_dt.Rows[0]["PARENT_CODE"];
            }
            catch (Exception ex)
            {
                
            }
        }      
        
        DataTable dt = WS.SelectAll(Connection, OfficeSpaceId, DatabaseName, "position", "");
        string strSort = "POSITION_CODE ASC";

        DataView dtview = new DataView(dt);
        dtview.Sort = strSort;
        DataTable dtsorted = dtview.ToTable();
       
        string POSITION_NAME, POSITION_CODE, PARENT_CODE;
        string SData = "";
        for (int i = 0; i < dtsorted.Rows.Count; i++)
        {
            if (dtsorted.Rows[i]["STATUS"].ToString()=="")
            {
                POSITION_NAME = dtsorted.Rows[i]["POSITION_NAME"].ToString();
                POSITION_CODE = dtsorted.Rows[i]["POSITION_CODE"].ToString();
                PARENT_CODE = dtsorted.Rows[i]["PARENT_CODE"].ToString();

                if (SData == "")
                    SData = "{";
                else
                    SData += ",{";

                SData += "\"NAME\":\"" + POSITION_NAME + "\"";
                SData += ",\"CODE\":\"" + POSITION_CODE + "\"";
                if (tmpPARENT_CODE.Trim() == POSITION_CODE.Trim())
                    SData += ",\"CHECK\":\"1\"";
                else
                    SData += ",\"CHECK\":\"0\"";


                SData += "}";
            }
           
        }

        Response.Write("{\"records\":[" + SData + "]}");
        
    }
    private void fnLoadMenu()
    {
        string tmpPOSITION_CODE = "";
        string tmpPOSITION_NAME = "";
        string tmpPARENT_CODE = "";
        string[] tmpMENU = null;
        string pID = Request.Params["ID"];
        if (pID != "")
        {
            WorkSpace.Service WS = new WorkSpace.Service();
            NextwaverDB.NWheres NWS = new NextwaverDB.NWheres();
            NWS.whereType = true;
            NWS.Where += "[@ID@ = '" + pID + "']";

            string NWS_Encrypt = new EncryptDecrypt.CryptorEngine().Encrypt(NWS.ExportString(), true);
            try
            {
                DataTable dt = WS.SelectAllColumnByWhere(Connection, OfficeSpaceId, DatabaseName, "position", NWS.ExportString(), "system");

                tmpPOSITION_CODE = "" + dt.Rows[0]["POSITION_CODE"];
                tmpPOSITION_NAME = "" + dt.Rows[0]["POSITION_NAME"];
                tmpPARENT_CODE = "" + dt.Rows[0]["PARENT_CODE"];
                string sMENU = "" + dt.Rows[0]["MENU"];
                tmpMENU = sMENU.Split(new char[] { ',' });
            }
            catch (Exception ex)
            {
                Response.Write("{\"output\":\"ERROR\",\"MSG\":\"ไม่สามารถโหลดข้อมูลได้\"}");
                return;
            }
        }

        XmlDocument xDoc = new XmlDocument();
        xDoc.Load(Server.MapPath("config/desktop.xml"));
        XmlNodeList listMenu = xDoc.SelectNodes("//config/menus");
        string SMenu = "";

        string Active = Request.Params["Active"];
        if (Active == "") Active = "1";

        

        for (int i = 0; i < listMenu.Count; i++)
        {
            //ID="1" Name="Demo" Icon="menu-icon fa fa-tachometer" Path=""
            string ID = listMenu[i].Attributes["ID"].Value;
            string Name = listMenu[i].Attributes["Name"].Value;
            string Icon = listMenu[i].Attributes["Icon"].Value;

            string MType = listMenu[i].Attributes["Type"].Value;

            if (SMenu == "")
                SMenu = "{";
            else
                SMenu += ",{";

            SMenu += "\"ID\":\"" + ID + "\"";
            SMenu += ",\"NAME\":\"" + Name + "\"";
            SMenu += ",\"ICON\":\"" + Icon + "\"";
            SMenu += ",\"CHECK\":\"" + checkMENU(tmpMENU, ID) + "\"";

            //SMenu += ",\"URL\":\"main.htm?ID=" + ID + "\"";

            string SubMenu = "";
            if (MType.ToUpper() == "URL")
            {
                string URL = "";
                try
                {
                    URL = listMenu[i].Attributes["Url"].Value;
                }
                catch { }
                SMenu += ",\"PATH\":\"" + URL + "\"";
                //{{x.PATH}}?ID={{ x.ID }}

                XmlNodeList SubNode = listMenu[i].SelectNodes("./menu");
                for (int j = 0; j < SubNode.Count; j++)
                {
                    //Name="Demo2" Icon="menu-icon fa fa-desktop" Url="../page/management.aspx"
                    string SubName = SubNode[j].Attributes["Name"].Value;
                    string SubIcon = SubNode[j].Attributes["Icon"].Value;
                    string SubUrl = SubNode[j].Attributes["Url"].Value;
                    string SubID = SubNode[j].Attributes["ID"].Value;
                    if (SubMenu == "")
                        SubMenu = "{";
                    else
                        SubMenu += ",{";

                    SubMenu += "\"ID\":\"" + ID + "." + j + "\"";
                    SubMenu += ",\"NAME\":\"" + SubName + "\"";
                    SubMenu += ",\"PATH\":\"" + SubUrl + "\"";

                    SubMenu += ",\"CLASS\":\"\"";
                    SubMenu += ",\"ISSUB\":\"0\"";
                    SubMenu += ",\"CHECK\":\"" + checkMENU(tmpMENU, ID) + "\"";                   

                    SubMenu += "}";
                }
            }
            else
            {
                string ManagementName = listMenu[i].Attributes["ManagementName"].Value;
                SMenu += ",\"PATH\":\"management.aspx?ID=" + ID + "&ConfigName=" + ManagementName + "\"";

                XmlDocument xManage = new XmlDocument();
                xManage.Load(Server.MapPath("config/" + ManagementName + ".xml"));
                XmlNodeList listView = xManage.SelectNodes("//Config/Views/View");
                for (int z = 0; z < listView.Count; z++)
                {
                    string SubName = listView[z].Attributes["Name"].Value;
                    string SubEnable = listView[z].Attributes["Enable"].Value;

                    if (SubMenu == "")
                        SubMenu = "{";
                    else
                        SubMenu += ",{";

                    SubMenu += "\"ID\":\"" + ID + "." + z + "\"";
                    SubMenu += ",\"NAME\":\"" + SubName + "\"";
                    SubMenu += ",\"PATH\":\"\"";
                    SubMenu += ",\"CHECK\":\"" + checkMENU(tmpMENU, ID + "." + z) + "\"";

                  

                    XmlNodeList listItem = listView[z].SelectNodes("./Item");
                    string SubMenuItem = "";
                    for (int y = 0; y < listItem.Count; y++)
                    {
                        string IconID = listItem[y].Attributes["IconID"].Value;
                        string sName = listItem[y].Attributes["Name"].Value;
                        string MappingID = listItem[y].Attributes["MappingID"].Value;
                        string SubItemID = ID + "." + z + "." + y;

                        XmlNode nodeMapping = xManage.SelectSingleNode("//Config/Mappings/Mapping[@ID='" + MappingID + "']");
                        // <Mapping ID="1" Name="Users" RowID="E" ManagementID="Management1" ToolID="Tools1" ThemeID="Theme1" ParameterID="Parameter1" />
                        string MID = nodeMapping.Attributes["ManagementID"].Value;
                        string TID = nodeMapping.Attributes["ToolID"].Value;

                        if (SubMenuItem == "")
                            SubMenuItem = "{";
                        else
                            SubMenuItem += ",{";

                        SubMenuItem += "\"ID\":\"" + SubItemID + "\"";
                        SubMenuItem += ",\"NAME\":\"" + sName + "\"";
                        SubMenuItem += ",\"PATH\":\"management.aspx?ID=" + SubItemID + "&CFN=" + ManagementName + "&MID=" + MID + "&TID=" + TID + "\"";
                        if (SubItemID == Active)
                        {
                            Active = ID;
                            SubMenu += ",\"ACTIVE\":\"active open\"";
                            SubMenuItem += ",\"ACTIVE\":\"active\"";
                        }
                        else
                            SubMenuItem += ",\"ACTIVE\":\"\"";

                        SubMenuItem += ",\"CHECK\":\"" + checkMENU(tmpMENU, SubItemID) + "\"";
                  
                      

                        SubMenuItem += "}";

                    }
                    SubMenu += ",\"SUBMENU\":[" + SubMenuItem + "]";

                    if (SubMenuItem == "")
                    {
                        SubMenu += ",\"CLASS\":\"\"";
                        SubMenu += ",\"ISSUB\":\"0\"";
                    }
                    else
                    {
                        SubMenu += ",\"CLASS\":\"dropdown-toggle\"";
                        SubMenu += ",\"ISSUB\":\"1\"";
                    }

                    SubMenu += "}";

                }

            }

            if (SubMenu == "")
            {
                SMenu += ",\"CLASS\":\"\"";
                SMenu += ",\"ISSUB\":\"0\"";
            }
            else
            {
                SMenu += ",\"CLASS\":\"dropdown-toggle\"";
                SMenu += ",\"ISSUB\":\"1\"";
            }
            if (ID == Active)
                SMenu += ",\"ACTIVE\":\"active\"";
            else
                SMenu += ",\"ACTIVE\":\"\"";

            SMenu += ",\"SUBMENU\":[" + SubMenu + "]";

            SMenu += "}";
        }


        Response.Write("{\"records\":[" + SMenu + "],\"POSITION_CODE\":\"" + tmpPOSITION_CODE + "\",\"POSITION_NAME\":\"" + tmpPOSITION_NAME + "\",\"PARENT_CODE\":\"" + tmpPARENT_CODE + "\"}");
    }
}