using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LoanServicingTasks.utiloan;

namespace LoanServicingTasks
{
    class BorrowerStatements
    {
        static void Main(string[] args)
        {
            Tasks webService = new Tasks();
            bool result = webService.ProcessBorrowerStatements("tadashigraves@gmail.com", "Yuki13", DateTime.Today);
            //  bool result = webService.ProcessBorrowerStatements("tadashigraves@gmail.com", "Yuki13", Convert.ToDateTime("6/30/2013"));
        }
    }
}
