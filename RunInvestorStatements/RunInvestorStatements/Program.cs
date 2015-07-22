using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using RunInvestorStatements.utiloan;

namespace RunInvestorStatements
{
    class Program
    {
        static void Main(string[] args)
        {
            Tasks webService = new Tasks();
            bool result = webService.ProcessInvestorStatements("tadashigraves@gmail.com", "Yuki13", DateTime.Today);
            //  bool result = webService.ProcessInvestorStatements("tadashigraves@gmail.com", "Yuki13", Convert.ToDateTime("6/30/2013"));
        }
    }
}
