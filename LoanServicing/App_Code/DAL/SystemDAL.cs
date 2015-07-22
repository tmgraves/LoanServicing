using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;

/// <summary>
/// Summary description for SystemDAL
/// </summary>
public class SystemDAL
{
	public SystemDAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    //<summary>
    // Return Dataset of alphabet
    //</summary>
    //<returns>DataSet</returns>
    //<remarks></remarks>
    public static DataTable AlphabetSet()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Index");
        dt.Columns.Add("Text"); 

        for (int i = 65; i <= 90; i++)
        {
            DataRow dr = dt.NewRow();
            dr[0] = Char.ConvertFromUtf32(i);
            dr[1] = Char.ConvertFromUtf32(i);
            dt.Rows.Add(dr);
        }
        DataRow drNew = dt.NewRow();
        drNew["Index"] = "";
        drNew["Text"] = "All";
        dt.Rows.Add(drNew);

        return dt;
    }

    //<summary>
    // Return Dataset of States
    //</summary>
    //<returns>DataSet</returns>
    //<remarks></remarks>
    public static DataSet States()
    {
        DataSet dsStates = new DataSet();

        dsStates.Tables.Add();
        //  Add Average columns
        dsStates.Tables[0].Columns.Add(new DataColumn("StateCode", typeof(string)));
        dsStates.Tables[0].Columns.Add(new DataColumn("State", typeof(string)));

        dsStates.Tables[0].Rows.Add(new Object[] { "AK", "Alaska" });
        dsStates.Tables[0].Rows.Add(new Object[] { "AL", "Alabama" });
        dsStates.Tables[0].Rows.Add(new Object[] { "AR", "Arkansas" });
        dsStates.Tables[0].Rows.Add(new Object[] { "AZ", "Arizona" });
        dsStates.Tables[0].Rows.Add(new Object[] { "CA", "California" });
        dsStates.Tables[0].Rows.Add(new Object[] { "CO", "Colorado" });
        dsStates.Tables[0].Rows.Add(new Object[] { "CT", "Connecticut" });
        dsStates.Tables[0].Rows.Add(new Object[] { "DC", "District of Columbia" });
        dsStates.Tables[0].Rows.Add(new Object[] { "DE", "Delaware" });
        dsStates.Tables[0].Rows.Add(new Object[] { "FL", "Florida" });
        dsStates.Tables[0].Rows.Add(new Object[] { "GA", "Georgia" });
        dsStates.Tables[0].Rows.Add(new Object[] { "HI", "Hawaii" });
        dsStates.Tables[0].Rows.Add(new Object[] { "IA", "Iowa" });
        dsStates.Tables[0].Rows.Add(new Object[] { "ID", "Idaho" });
        dsStates.Tables[0].Rows.Add(new Object[] { "IL", "Illinois" });
        dsStates.Tables[0].Rows.Add(new Object[] { "IN", "Indiana" });
        dsStates.Tables[0].Rows.Add(new Object[] { "KS", "Kansas" });
        dsStates.Tables[0].Rows.Add(new Object[] { "KY", "Kentucky" });
        dsStates.Tables[0].Rows.Add(new Object[] { "LA", "Louisiana" });
        dsStates.Tables[0].Rows.Add(new Object[] { "MA", "Massachusetts" });
        dsStates.Tables[0].Rows.Add(new Object[] { "MD", "Maryland" });
        dsStates.Tables[0].Rows.Add(new Object[] { "ME", "Maine" });
        dsStates.Tables[0].Rows.Add(new Object[] { "MI", "Michigan" });
        dsStates.Tables[0].Rows.Add(new Object[] { "MN", "Minnesota" });
        dsStates.Tables[0].Rows.Add(new Object[] { "MO", "Missouri" });
        dsStates.Tables[0].Rows.Add(new Object[] { "MS", "Mississippi" });
        dsStates.Tables[0].Rows.Add(new Object[] { "MT", "Montana" });
        dsStates.Tables[0].Rows.Add(new Object[] { "NC", "North Carolina" });
        dsStates.Tables[0].Rows.Add(new Object[] { "ND", "North Dakota" });
        dsStates.Tables[0].Rows.Add(new Object[] { "NE", "Nebraska" });
        dsStates.Tables[0].Rows.Add(new Object[] { "NH", "New Hampshire" });
        dsStates.Tables[0].Rows.Add(new Object[] { "NJ", "New Jersey" });
        dsStates.Tables[0].Rows.Add(new Object[] { "NM", "New Mexico" });
        dsStates.Tables[0].Rows.Add(new Object[] { "NV", "Nevada" });
        dsStates.Tables[0].Rows.Add(new Object[] { "NY", "New York" });
        dsStates.Tables[0].Rows.Add(new Object[] { "OH", "Ohio" });
        dsStates.Tables[0].Rows.Add(new Object[] { "OK", "Oklahoma" });
        dsStates.Tables[0].Rows.Add(new Object[] { "OR", "Oregon" });
        dsStates.Tables[0].Rows.Add(new Object[] { "PA", "Pennsylvania" });
        dsStates.Tables[0].Rows.Add(new Object[] { "RI", "Rhode Island" });
        dsStates.Tables[0].Rows.Add(new Object[] { "SC", "South Carolina" });
        dsStates.Tables[0].Rows.Add(new Object[] { "SD", "South Dakota" });
        dsStates.Tables[0].Rows.Add(new Object[] { "TN", "Tennessee" });
        dsStates.Tables[0].Rows.Add(new Object[] { "TX", "Texas" });
        dsStates.Tables[0].Rows.Add(new Object[] { "UT", "Utah" });
        dsStates.Tables[0].Rows.Add(new Object[] { "VA", "Virginia" });
        dsStates.Tables[0].Rows.Add(new Object[] { "VT", "Vermont" });
        dsStates.Tables[0].Rows.Add(new Object[] { "WA", "Washington" });
        dsStates.Tables[0].Rows.Add(new Object[] { "WI", "Wisconsin" });
        dsStates.Tables[0].Rows.Add(new Object[] { "WV", "West Virginia" });
        dsStates.Tables[0].Rows.Add(new Object[] { "WY", "Wyoming" });

        return dsStates;
    }

    /// <summary>
    /// GetPaymentMethods is a method to search for PaymentMethods records
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet GetPaymentMethods()
    {
        // Declare variables
        DataSet dsPaymentMethods = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_PaymentMethods_Search", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsPaymentMethods);

        return dsPaymentMethods;
    }
}