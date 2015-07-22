using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.IO;
using System.Configuration;

/// <summary>
/// Summary description for SystemBLL
/// </summary>
public class SystemBLL
{
	public SystemBLL()
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
        // Call DataLayer method
        return SystemDAL.AlphabetSet();
    }

    //<summary>
    // Return Dataset of States
    //</summary>
    //<returns>DataSet</returns>
    //<remarks></remarks>
    public static DataSet States()
    {
        // Call DataLayer method
        return SystemDAL.States();
    }

    /// <summary>
    /// GetPaymentMethods is a method to search for PaymentMethods records
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet GetPaymentMethods()
    {
        // Call DataLayer method
        return SystemDAL.GetPaymentMethods();
    }
}