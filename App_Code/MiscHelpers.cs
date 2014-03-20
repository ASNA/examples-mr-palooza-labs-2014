using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;


/// <summary>
/// Summary description for MiscHelpers
/// </summary>
public class MiscHelpers
{

    ASNA.Monarch.WebDspF.Page owningPage; 
    System.Web.HttpContext context;

	public MiscHelpers(ASNA.Monarch.WebDspF.Page owningPage, System.Web.HttpContext context)
	{
        this.context = context;
        this.owningPage = owningPage;
	}

    public bool StringsAreEqual(string value1, string value2)
    {
        return String.Equals(value1,value2,StringComparison.OrdinalIgnoreCase);
    }

    public DataTable GetDataTable(string formatName) {
        DataTable result;
        ASNA.Monarch.WebDevice device;
        DataSet ds;
        device = (ASNA.Monarch.WebDevice)context.Session["device"];

        ds = device.ActiveDisplayFile.DataSet; 
        result = ds.Tables[formatName];	

        if (result == null) {
            throw new System.ArgumentException(formatName + " not found in Mobile RPG DataSet.");
        }

        return result;
    }        

    public object GetDspField(string formatName, string fieldName) {
        DataTable dt;
        DataRow row;
        object result = null;

        dt = GetDataTable(formatName);
        if (dt != null && dt.Rows.Count > 0 ) {
            row = dt.Rows[0];
            if ( row != null) {
                result = row[fieldName];
            }
        }

        return result;
    }

    public bool SetDspField(string formatName, string fieldName, object fieldValue) {
        DataTable dt;
        DataRow row;
        bool result = false;

        dt = GetDataTable(formatName);
        if (dt != null && dt.Rows.Count > 0 ) {
            row = dt.Rows[0];
            row[fieldName] = fieldValue;
            result = true;
        }

        return result;
    }

}

