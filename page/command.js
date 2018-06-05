function ToolClick(ConfigName, TID, Command) {
   switch (ConfigName) {
        case "Administrator": class_Demo(TID, Command); break;
        case "Gunbook": class_Demo(TID, Command); break;
        case "AppJob": class_Demo(TID, Command); break;
        default: alert("No ConfigName"); break;
    }
}
//====================== Demo ======================
function class_Demo(TID, Command) {  
    switch (TID) {
        case "Tools1": fnDemo_Tools1(Command); break;
        case "Tools2": fnUserType_Tools(Command); break;
        case "Tools3": fnWaterMask_Tools4(Command); break;
        case "Tools4": fnLog_Tools(Command); break;
 
        case "GunTools": fnGunbook_Tools(Command); break;
        case "ReGunTools": fnGunbook_Tools(Command); break;
        case "PageTools": fnGunbook_Tools(Command); break;
        case "PageToolsView": fnGunbook_Tools(Command); break;
        case "PageToolImport": fnGunbook_Tools(Command); break;
        case "PageToolImportGunNo": fnGunbook_Tools(Command); break;
        case "PageToolImportGunNoNew": fnGunbook_Tools(Command); break;
        case "RePageTools": fnGunbook_Tools(Command); break;
        case "GunTypeTools": fnStandardData_Tools(Command); break;
        case "GunSizeTools": fnStandardData_Tools(Command); break;
        case "GunBrandTools": fnStandardData_Tools(Command); break;
        case "GunBarrelTools": fnStandardData_Tools(Command); break;
        case "GunColorTools": fnStandardData_Tools(Command); break;
        case "GunOwnerTools": fnStandardData_Tools(Command); break;
        case "GunCountryTools": fnStandardData_Tools(Command); break;
        case "ExpGunTools": fnGunbook_Tools(Command); break;
        case "PageUpVerTools": fnGunbook_Tools(Command); break;

        case "AppJob": fnAppJob_Tools(Command); break;

        default: alert("No Tools  " + Command + " " + TID + " Function in DEMO"); break;
    }
}
//-----AppJob example----
function fnAppJob_Tools(Command) {
    switch (Command) {
        case "AddAppJob":
            var url = "../gunbook/AppJob.aspx";
            showpopup('เพิ่มข้อมูลใบสมัครงาน', url, 650, 680);
            break;
        case "EditAppJob":
            var SelectRows = getSelectRows();
            var ID = getCurrentValue(SelectRows, "ID");
            if (ID == "") return;
            var url = "../gunbook/AppJob.aspx?ID=" + ID;
            showpopup('แก้ไขข้อมูลใบสมัครงาน', url, 650, 680);
            break;
        case "DeleteAppJob":
            var SelectRows = getSelectRows();
            if (SelectRows == null) {
                showmessage("โปรดเลือกรายการที่จะทำการแก้ไข");
                return "";
            }
            if (SelectRows.length == 0) {
                showmessage("โปรดเลือกรายการที่จะทำการแก้ไข");
                return "";
            }

            var ID_LIST = new Array();
            for (var i = 0; i < SelectRows.length; i++) {
                for (var j = 0; j < SelectRows[i].COLUMN.length; j++) {
                    if ("ID" == SelectRows[i].COLUMN[j].NAME) {
                        ID_LIST.push(SelectRows[i].COLUMN[j].VALUE);
                    }
                }
            }

            showconfirm("คุณแน่ใจหรือไม่ที่จะทำการลบข้อมูล ?", fnDeleteAppJob, ID_LIST);
            break;

        default: alert("No Command in Tools demo function sss"); break;
    }
}

function fnDeleteAppJob(ID_LIST) {

    fnLoading();

    var data = $.param({
        Command: 'DeleteAppJob',
        ID_LIST: ID_LIST.toString()
    });

    $http_gobal.post("../server/Server_Gunbook.aspx", data, config)
        .success(function (data, status, headers, config) {
            if (data.output == "OK") {
                showmessage("ลบข้อมูลเรียบร้อยแล้ว", refreshAllData);
            } else {
                showmessage(data.MSG, fnUnLoading);
            }
        })
        .error(function (data, status, header, config) {
            alert(data);
        }
        );
}
//-----------
function fnWaterMask_Tools4(Command) {
    switch (Command) {
        case "AddWaterMask":
            var url = "../users/waterMask.aspx";
            showpopup('เพิ่มข้อมูลลายน้ำ', url, 710, 650);
            break;
        case "EditWaterMask":
            var SelectRows = getSelectRows();
            var ID = getCurrentValue(SelectRows, "ID");
            if (ID == "") return;
            var url = "../users/waterMask.aspx?ID=" + ID;
            showpopup('แก้ไขข้อมูลลายน้ำ', url, 710, 650);
            break;
        case "DeleteWaterMask":
            var SelectRows = getSelectRows();
            if (SelectRows == null) {
                showmessage("โปรดเลือกรายการที่จะทำการแก้ไข");
                return "";
            }
            if (SelectRows.length == 0) {
                showmessage("โปรดเลือกรายการที่จะทำการแก้ไข");
                return "";
            }

            var ID_LIST = new Array();
            for (var i = 0; i < SelectRows.length; i++) {
                for (var j = 0; j < SelectRows[i].COLUMN.length; j++) {
                    if ("ID" == SelectRows[i].COLUMN[j].NAME) {
                        ID_LIST.push(SelectRows[i].COLUMN[j].VALUE);
                    }
                }
            }

            showconfirm("คุณแน่ใจหรือไม่ที่จะทำการลบลายน้ำเหล่านี้ ?" , fnDeleteAppJob, ID_LIST);
            break;

        default: alert("No Command in Tools demo function sss"); break;
    }
}


 

function fnLog_Tools(Command) {
    switch (Command) {
        case "DeleteLog":
            var SelectRows = getSelectRows();
            if (SelectRows == null) {
                showmessage("โปรดเลือกรายการที่จะทำการลบข้อมูล");
                return "";
            }
            if (SelectRows.length == 0) {
                showmessage("โปรดเลือกรายการที่จะทำการลบข้อมูล");
                return "";
            }

            var ID_LIST = new Array();
            for (var i = 0; i < SelectRows.length; i++) {
                for (var j = 0; j < SelectRows[i].COLUMN.length; j++) {
                    if ("ID" == SelectRows[i].COLUMN[j].NAME) {
                        ID_LIST.push(SelectRows[i].COLUMN[j].VALUE);
                    }
                }
            }

            showconfirm("คุณแน่ใจหรือไม่ที่จะทำการลบข้อมูล ?", fnDeleteLog, ID_LIST);
            break;
        case "ReportLogs":
            var url = "../users/ReportLogs.aspx";
            showpopup('Report Logs', url, 300, 500);
            break;
    
        
        default: alert("No Command in Tools demo function"); break;
    }
}
function fnUserType_Tools(Command) {    
   
    switch (Command) {
        case "NewPosition":
            var url = "../users/user_type.aspx";
            showpopup('เพิ่มข้อมูลกลุ่มผู้ใช้งาน', url, 600);
            break;
        case "EditPosition":
            var SelectRows = getSelectRows();
            var ID = getCurrentValue(SelectRows, "ID");
            if (ID == "") return;   
            var url = "../users/user_type.aspx?ID=" + ID;           
            showpopup('แก้ไขข้อมูลกลุ่มผู้ใช้งาน', url, 600);
            break;
        case "DeletePosition":
            var SelectRows = getSelectRows();
            if (SelectRows == null) {
                showmessage("โปรดเลือกรายการที่จะทำการลบข้อมูล");
                return "";
            }
            if (SelectRows.length == 0) {
                showmessage("โปรดเลือกรายการที่จะทำการลบข้อมูล");
                return "";
            }

            var ID_LIST = new Array();
            for (var i = 0; i < SelectRows.length; i++) {
                for (var j = 0; j < SelectRows[i].COLUMN.length; j++) {
                    if ("ID" == SelectRows[i].COLUMN[j].NAME) {
                        ID_LIST.push(SelectRows[i].COLUMN[j].VALUE);
                    }
                }
            }

            showconfirm("คุณแน่ใจหรือไม่ที่จะทำการลบข้อมูลนี้ ?", fnDeletePosition, ID_LIST);
            break;
        default: alert("No Command in Tools demo function"); break;
    }
}
function fnDemo_Tools1(Command) {
    switch (Command) {
        case "AddUser":
            var url = "../users/user.aspx";
            showpopup('เพิ่มข้อมูลผู้ใช้งาน', url, 520, 450);
            break;
        case "EditUser":
            var SelectRows = getSelectRows();
            var ID = getCurrentValue(SelectRows, "ID");
            if (ID == "") return;
            var url = "../users/user.aspx?ID=" + ID;
            showpopup('แก้ไขข้อมูลผู้ใช้งาน', url, 520, 450);
            break;
        case "DeleteUser":
            var SelectRows = getSelectRows();
            if (SelectRows == null) {
                showmessage("โปรดเลือกรายการที่จะทำการแก้ไข");
                return "";
            }
            if (SelectRows.length == 0) {
                showmessage("โปรดเลือกรายการที่จะทำการแก้ไข");
                return "";
            }

            var ID_LIST = new Array();
            for (var i = 0; i < SelectRows.length; i++) {
                for (var j = 0; j < SelectRows[i].COLUMN.length; j++) {
                    if ("ID" == SelectRows[i].COLUMN[j].NAME) {
                        ID_LIST.push(SelectRows[i].COLUMN[j].VALUE);
                    }
                }
            }

            showconfirm("คุณแน่ใจหรือไม่ที่จะทำการลบผู้ใช้งานเหล่านี้ ?", fnDeleteUser, ID_LIST);
            break;

        default: alert("No Command in Tools demo function"); break;
    }
}

function fnGunbook_Tools(Command) {
    switch (Command) {
          //====================Import DataGroup Page==========================
        case "AddImportData":
            var url = "../gunbook/ImportDataMultiPages.aspx";
            showpopupFull('เพิ่มข้อมูลหนังสือทะเบียนอาวุธปืน', url);
            break;
        case "EditImportData":
            var SelectRows = getSelectRows();
            var ID = getCurrentValue(SelectRows, "ID");
            if (ID == "") return;
            var url = "../gunbook/ImportDataMultiPages.aspx?ID=" + ID;
            showpopupFull('แก้ไขข้อมูลหนังสือทะเบียนอาวุธปืน', url);
            break;
       //====================Import GunNo Page==========================
        case "EditImportGunNo":
            var SelectRows = getSelectRows();
            var ID = getCurrentValue(SelectRows, "ID");
            if (ID == "") return;
            var url = "../gunbook/dtEntryGunNo.aspx?ID=" + ID;
            showpopupFull('แก้ไขข้อมูลหนังสือทะเบียนอาวุธปืน', url);
            break;
       //=======================insert GunNo 1file===============================================  
        case "EditImportGunNoNew":
            var SelectRows = getSelectRows();
            var ID = getCurrentValue(SelectRows, "ID");
            if (ID == "") return;
            var url = "../gunbook/dtGunNoOneFile.aspx?ID=" + ID;
            showpopupFull('แก้ไขข้อมูลหนังสือทะเบียนอาวุธปืน', url);
            break;

     //=====================================================================================
            
        case "AddGunBook":
            var url = "../gunbook/addBook.aspx";
            showpopup('เพิ่มข้อมูลหนังสือทะเบียนอาวุธปืน', url, 400, 500);
            break;
        case "EditGunBook":
            var SelectRows = getSelectRows();
            var ID = getCurrentValue(SelectRows, "ID");
            if (ID == "") return;
            var url = "../gunbook/addBook.aspx?ID=" + ID;
            showpopup('แก้ไขข้อมูลหนังสือทะเบียนอาวุธปืน', url, 400, 500);
            break;
        case "AddGunPage":
            var url = "../gunbook/addPageNew.aspx";
            showpopup('เพิ่มข้อมูลหนังสือทะเบียนอาวุธปืน', url, 400, 500);
            break;
        case "EditGunPage":
            var SelectRows = getSelectRows();
            var ID = getCurrentValue(SelectRows, "ID");
            if (ID == "") return;
            var url = "../gunbook/addPage.aspx?ID=" + ID;
            showpopupFull('แก้ไขข้อมูลหนังสือทะเบียนอาวุธปืน', url);
            break;
        case "ViewData":
            var SelectRows = getSelectRows();
            var ID = getCurrentValue(SelectRows, "ID");
            if (ID == "") return;
            var url = "../gunbook/viewPage.aspx?ID=" + ID;
            showpopupFull('ข้อมูลทะเบียนอาวุธปืน', url);
            break;
        case "UpdateVersion":
            var SelectRows = getSelectRows();

            var BOOKNO = getCurrentValue(SelectRows, "BOOKNO");
            var PAGENO = getCurrentValue(SelectRows, "PAGENO");
            var LASTVERSION = getCurrentValue(SelectRows, "LASTVERSION");
            if (BOOKNO == "") return;
            var url = "../gunbook/updateVersionImg.aspx?BOOKNO=" + BOOKNO + "&PAGENO=" + PAGENO + "&LASTVERSION=" + LASTVERSION;
            showpopupFull('ระบบจัดการรูปภาพเอกสาร', url);
            break;
        case "LoadGunBook":
            window.open("../download/Debug.zip", "_blank")
            break;
        case "LoadBookPDF":
            window.open("../genbooktask.html", "_blank")
            break;
        case "CancelExpGunBook":
            var SelectRows = getSelectRows();
            if (SelectRows == null) {
                showmessage("โปรดเลือกรายการที่จะทำการยกเลิก");
                return "";
            }
            if (SelectRows.length == 0) {
                showmessage("โปรดเลือกรายการที่จะทำการยกเลิก");
                return "";
            }

            var ID_LIST = new Array();
            for (var i = 0; i < SelectRows.length; i++) {
                for (var j = 0; j < SelectRows[i].COLUMN.length; j++) {
                    if ("ID" == SelectRows[i].COLUMN[j].NAME) {
                        ID_LIST.push(SelectRows[i].COLUMN[j].VALUE);
                    }
                }
            }

            showconfirm("คุณแน่ใจหรือไม่ที่จะทำการยกเลิก ?", fnExpCancelBook, ID_LIST);
            break;

        case "setDestoryBook":
            var SelectRows = getSelectRows();
            var ID = getCurrentValue(SelectRows, "ID");
            if (ID == "") return;
            var url = "../gunbook/setDestroryBook.aspx?ID=" + ID;
            showpopup('กำหนดวันที่ทำลายเอกสาร', url, 420, 500);
            break;
        case "setDestoryPage":
            var SelectRows = getSelectRows();
            var ID = getCurrentValue(SelectRows, "ID");
            if (ID == "") return;
            var url = "../gunbook/setDestroryPage.aspx?ID=" + ID;
            showpopup('กำหนดวันที่ทำลายเอกสาร', url, 420, 500);
            break;
        case "CancelGunBook":
            var SelectRows = getSelectRows();
            if (SelectRows == null) {
                showmessage("โปรดเลือกรายการที่จะทำการยกเลิกการลบข้อมูล");
                return "";
            }
            if (SelectRows.length == 0) {
                showmessage("โปรดเลือกรายการที่จะทำการยกเลิกการลบข้อมูล");
                return "";
            }

            var ID_LIST = new Array();
            for (var i = 0; i < SelectRows.length; i++) {
                for (var j = 0; j < SelectRows[i].COLUMN.length; j++) {
                    if ("ID" == SelectRows[i].COLUMN[j].NAME) {
                        ID_LIST.push(SelectRows[i].COLUMN[j].VALUE);
                    }
                }
            }

            showconfirm("คุณแน่ใจหรือไม่ที่จะทำการยกเลิกการลบข้อมูล ?", fnReDeleteBook, ID_LIST);
            break;
        case "CancelGunPage":
            var SelectRows = getSelectRows();
            if (SelectRows == null) {
                showmessage("โปรดเลือกรายการที่จะทำการยกเลิกการลบข้อมูล");
                return "";
            }
            if (SelectRows.length == 0) {
                showmessage("โปรดเลือกรายการที่จะทำการยกเลิกการลบข้อมูล");
                return "";
            }

            var ID_LIST = new Array();
            for (var i = 0; i < SelectRows.length; i++) {
                for (var j = 0; j < SelectRows[i].COLUMN.length; j++) {
                    if ("ID" == SelectRows[i].COLUMN[j].NAME) {
                        ID_LIST.push(SelectRows[i].COLUMN[j].VALUE);
                    }
                }
            }

            showconfirm("คุณแน่ใจหรือไม่ที่จะทำการยกเลิกการลบข้อมูล ?", fnReDeletePage, ID_LIST);
            break;
        case "DeleteGunPage":
            var SelectRows = getSelectRows();
            if (SelectRows == null) {
                showmessage("โปรดเลือกรายการที่จะทำการลบข้อมูล");
                return "";
            }
            if (SelectRows.length == 0) {
                showmessage("โปรดเลือกรายการที่จะทำการลบข้อมูล");
                return "";
            }

            var ID_LIST = new Array();
            for (var i = 0; i < SelectRows.length; i++) {
                for (var j = 0; j < SelectRows[i].COLUMN.length; j++) {
                    if ("ID" == SelectRows[i].COLUMN[j].NAME) {
                        ID_LIST.push(SelectRows[i].COLUMN[j].VALUE);
                    }
                }
            }

            showconfirm("คุณแน่ใจหรือไม่ที่จะทำการลบข้อมูล ?", fnDeletePage, ID_LIST);
            break;
        case "DeleteGunBook":
            var SelectRows = getSelectRows();
            if (SelectRows == null) {
                showmessage("โปรดเลือกรายการที่จะทำการลบข้อมูล");
                return "";
            }
            if (SelectRows.length == 0) {
                showmessage("โปรดเลือกรายการที่จะทำการลบข้อมูล");
                return "";
            }

            var ID_LIST = new Array();
            for (var i = 0; i < SelectRows.length; i++) {
                for (var j = 0; j < SelectRows[i].COLUMN.length; j++) {
                    if ("ID" == SelectRows[i].COLUMN[j].NAME) {
                        ID_LIST.push(SelectRows[i].COLUMN[j].VALUE);
                    }
                }
            }

            showconfirm("คุณแน่ใจหรือไม่ที่จะทำการลบข้อมูล ?", fnDeleteBook, ID_LIST);
            break;
        default: alert("No Command in Tools demo function"); break;
    }
}

function fnStandardData_Tools(Command) {

    if (Command.indexOf("Add") !== -1) {
        var url = "../gunbook/addStandardCode.aspx?Command=" + Command;
        showpopup('เพิ่มข้อมูล', url, 300, 700);
    }
    else if (Command.indexOf("Edit") !== -1) {
        var SelectRows = getSelectRows();
        var ID = getCurrentValue(SelectRows, "ID");
        if (ID == "") return;
        var url = "../gunbook/addStandardCode.aspx?ID=" + ID + "&Command=" + Command;
        showpopup('เพิ่มข้อมูล', url, 300, 700);
    }
    else if (Command.indexOf("Delete") !== -1) {
        var SelectRows = getSelectRows();
        var ID = getCurrentValue(SelectRows, "ID");
        if (ID == "") return;
        bootbox.confirm("<span class='bigger-125'>คุณแน่ใจหรือไม่ที่จะทำการลบข้อมูลนี้ ?</span>", function (result) {
            if (result) {
                fnDeleteStandCode(ID, Command.replace("Delete", ""));
            }
        });
    }
    else
        alert("No Command in Tools demo function");
}

function fnDeletePosition(ID_LIST) {
    fnLoading();

    var data = $.param({
        Command: 'DeletePosition',
        ID_LIST: ID_LIST.toString()
    });

    $http_gobal.post("../server/Server_User.aspx", data, config)
        .success(function (data, status, headers, config) {
            if (data.output == "OK") {
                showmessage("ลบข้อมูลเรียบร้อยแล้ว", refreshAllData);
            } else {
                showmessage(data.MSG, fnUnLoading);
            }
        })
        .error(function (data, status, header, config) {
            alert(data);
        }
        );
}
function fnDeleteUser(ID_LIST) {

    fnLoading();

    var data = $.param({
        Command: 'DeleteUser',
        ID_LIST: ID_LIST.toString()
    });

    $http_gobal.post("../server/Server_User.aspx", data, config)
        .success(function (data, status, headers, config) {
            if (data.output == "OK") {
                showmessage("ลบข้อมูลเรียบร้อยแล้ว", refreshAllData);
            } else {
                showmessage(data.MSG, fnUnLoading);
            }
        })
        .error(function (data, status, header, config) {
            alert(data);
        }
        );
}
function fnExpCancelBook(ID_LIST) {
    fnLoading();

    var data = $.param({
        Command: 'ExpCancelBook',
        ID_LIST: ID_LIST.toString()
    });

    $http_gobal.post("../server/Server_Gunbook.aspx", data, config)
        .success(function (data, status, headers, config) {
            if (data.output == "OK") {
                showmessage("ยกเลิกข้อมูลเรียบร้อยแล้ว", refreshAllData);
            } else {
                showmessage(data.MSG, fnUnLoading);
            }
        })
        .error(function (data, status, header, config) {
            alert(data);
        }
        );
}
function fnReDeleteBook(ID_LIST) {
    fnLoading();

    var data = $.param({
        Command: 'ReDeleteBook',
        ID_LIST: ID_LIST.toString()
    });

    $http_gobal.post("../server/Server_Gunbook.aspx", data, config)
        .success(function (data, status, headers, config) {
            if (data.output == "OK") {
                showmessage("ยกเลิกการลบข้อมูลเรียบร้อยแล้ว", refreshAllData);
            } else {
                showmessage(data.MSG, fnUnLoading);
            }
        })
        .error(function (data, status, header, config) {
            alert(data);
        }
        );
}
function fnReDeletePage(ID_LIST) {

    fnLoading();

    var data = $.param({
        Command: 'ReDeletePage',
        ID_LIST: ID_LIST.toString()
    });

    $http_gobal.post("../server/Server_Gunbook.aspx", data, config)
        .success(function (data, status, headers, config) {
            if (data.output == "OK") {
                showmessage("ยกเลิกการลบข้อมูลเรียบร้อยแล้ว", refreshAllData);
            } else {
                showmessage(data.MSG, fnUnLoading);
            }
        })
        .error(function (data, status, header, config) {
            alert(data);
        }
        );
}
function fnDeleteBook(ID_LIST) {

    fnLoading();

    var data = $.param({
        Command: 'DeleteBook',
        ID_LIST: ID_LIST.toString()
    });

    $http_gobal.post("../server/Server_Gunbook.aspx", data, config)
        .success(function (data, status, headers, config) {
            if (data.output == "OK") {
                showmessage("ลบข้อมูลเรียบร้อยแล้ว", refreshAllData);
            } else {
                showmessage(data.MSG, fnUnLoading);
            }
        })
        .error(function (data, status, header, config) {
            alert(data);
        }
        );
}
function fnDeleteLog(ID_LIST) {
    fnLoading();

    var data = $.param({
        Command: 'DeleteLog',
        ID_LIST: ID_LIST.toString()
    });

    $http_gobal.post("../server/Server_Gunbook.aspx", data, config)
        .success(function (data, status, headers, config) {
            if (data.output == "OK") {
                showmessage("ลบข้อมูลเรียบร้อยแล้ว", refreshAllData);
            } else {
                showmessage(data.MSG, fnUnLoading);
            }
        })
        .error(function (data, status, header, config) {
            alert(data);
        }
        );
}
function fnDeletePage(ID_LIST) {

    fnLoading();
   
    var data = $.param({
        Command: 'DeletePage',
        ID_LIST: ID_LIST.toString()
    });

    $http_gobal.post("../server/Server_Gunbook.aspx", data, config)
        .success(function (data, status, headers, config) {
            if (data.output == "OK") {
                showmessage("ลบข้อมูลเรียบร้อยแล้ว", refreshAllData);
            } else {
                showmessage(data.MSG, fnUnLoading);
            }
        })
        .error(function (data, status, header, config) {
            alert(data);
        }
        );
}

function fnDeleteWaterMask(ID_LIST) {

    fnLoading();

    var data = $.param({
        Command: 'DeleteWaterMask',
        ID_LIST: ID_LIST.toString()
    });

    $http_gobal.post("../server/Server_User.aspx", data, config)
        .success(function (data, status, headers, config) {
            if (data.output == "OK") {
                showmessage("ลบข้อมูลเรียบร้อยแล้ว", refreshAllData);
            } else {
                showmessage(data.MSG, fnUnLoading);
            }
        })
        .error(function (data, status, header, config) {
            alert(data);
        }
        );
}
function fnDeleteStandCode(strID, dataType) {

    fnLoading();

    var data = $.param({
        Command: 'DeleteStandard',
        datatype: dataType,
        ID: strID
    });

    $http_gobal.post("../server/Server_Gunbook.aspx", data, config)
        .success(function (data, status, headers, config) {
            if (data.output == 'OK') {
                showmessage("ลบข้อมูลเรียบร้อยแล้ว", refreshAllData);
            } else {
                showmessage(data.MSG, fnUnLoading);
            }
        })
        .error(function (data, status, header, config) { alert(data); });
}
//window.parent.ชื่อฟังก์
function fnProduct_Tools3(Command) {
    switch (Command) {

        case "EditDocument":
            var url = "../users/Default.aspx";
            showpopup('เพิ่มข้อมูลผู้ใช้งาน', url, 600);
            //alert(SelectRows[0].PRO_ID);
            break;
        default: alert("No Command in Tools demo function"); break;
    }
}

//==================================================

