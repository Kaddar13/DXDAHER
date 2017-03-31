using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DX_DAHERCMS
{
    public class ClassGlobal
    {
        static string CSVFileReport;
        public static string CheminFichier
        {
            get
            {
                return CSVFileReport;
            }
            set
            {
                CSVFileReport = value;
            }
        }
    }
}